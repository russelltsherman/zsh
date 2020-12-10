if chk::command "ansible"
then
  alias a='ansible'
  alias ap='ansible-playbook'
  alias al='ansible-pull'
  alias avc='ansible-vault create'
  alias ave='ansible-vault edit'
  alias avr='ansible-vault rekey'
  alias avenc='ansible-vault encrypt'
  alias avdec='ansible-vault decrypt'
  alias avv='ansible-vault view'
  alias aga='ansible-galaxy'
  alias agad='ansible-galaxy delete'
  alias agai='ansible-galaxy install'
  alias agaim='ansible-galaxy import'
  alias againf='ansible-galaxy info'
  alias agal='ansible-galaxy list'
  alias agalog='ansible-galaxy login'
  alias agar='ansible-galaxy remove'
  alias agas='ansible-galaxy search'

else
  echo "ansible not found. execute 'ansible::install' to install it."

  ansible::install() {
    pkg::install "ansible" "ppa:ansible/ansible"
  }
fi
