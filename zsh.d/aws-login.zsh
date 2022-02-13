#!/usr/bin/env bash

AWS_MFA_PROFILE="aws"

# function for launching a shell with aws vault authentication
# Usage: awsshell [aws-profile] [mfa-profile]

awsshell() {
    aws_profile="${1:-${AWS_PROFILE}}"
    mfa_profile="${2:-${AWS_MFA_PROFILE}}"

    aws-vault exec --mfa-token="$(mfa "$mfa_profile")" "$aws_profile" -- zsh -l
}

# function for launching a shell with aws vault authentication
# Usage: awsconsole [aws-profile] [mfa-profile]

awsconsole() {
    aws_profile="${1:-${AWS_PROFILE}}"
    mfa_profile="${2:-${AWS_MFA_PROFILE}}"

    aws-vault login "$aws_profile" --mfa-token="$(mfa "$mfa_profile")" 
}
