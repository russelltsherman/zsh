#!/usr/bin/env zsh

if [ $ACTIVE_PROFILE = "blockhenge" ]
then
  alias::new 'cdco' 'cd ~/src/gitlab.com/bhco/cryptomnio && code .'
  alias::new 'cdef' 'cd ~/src/gitlab.com/bhco/ef && code .'
fi

if [ $ACTIVE_PROFILE = "finbotsdev" ]
then
  alias::new 'cdfx' 'cd ~/src/github.com/finbotsdev/developer && code .'
fi

if [ $ACTIVE_PROFILE = "paymentapproved" ]
then
  alias::new 'apps' 'cd ~/src/gitlab.com/paymentapproved/apps; code apps.code-workspace'
  alias::new 'infra' 'cd ~/src/gitlab.com/paymentapproved/infrastructure; code .'
  alias::new 'wtf' 'cd ~/src/gitlab.com/paymentapproved/infrastructure/terraform; code .'
  alias::new 'pa proc' 'cd ~/src/gitlab.com/paymentapproved && code process && cd $OLDPWD'
fi
