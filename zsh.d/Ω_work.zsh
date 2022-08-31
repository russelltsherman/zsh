#!/usr/bin/env zsh

if [ $ACTIVE_PROFILE = "paymentapproved" ]
then
  alias::new 'apps' 'cd ~/src/gitlab.com/paymentapproved/apps; code apps.code-workspace'
  alias::new 'infra' 'cd ~/src/gitlab.com/paymentapproved/infrastructure; code .'
  alias::new 'wtf' 'cd ~/src/gitlab.com/paymentapproved/infrastructure/terraform; code .'
  alias::new 'pa proc' 'cd ~/src/gitlab.com/paymentapproved && code process && cd $OLDPWD'
fi
