
banner='
               _                      _
  ___ ___   __| | ___ _ __ ___  _ __ (_)_ __
 / __/ _ \ / _  |/ _ \  __/ _ \|  _ \| |  _ \
| (_| (_) | (_| |  __/ | | (_) | | | | | | | |
 \___\___/ \__,_|\___|_|  \___/|_| |_|_|_| |_|
'
export BANNER="${BANNER:-$banner}"

# usage:
#     tui::banner
tui::banner() {
  clear
  echo::green "${BANNER}"
}

# usage:
#     tui::action "action message"
tui::action() {
  local msg="${1:-}"
  echo::yellow "[action]: ⇒ ${msg}" 1>&2
}

# usage:
#     tui::bot "bot message"
tui::bot() {
  local msg="${1:-}"
  echo::green "\n \[._.]/ - ${msg}" 1>&2
}

# usage:
#     tui::bot_confirm "bot asking for confirmation"
tui::bot_confirm() {
  local msg="${1:-}"
  tui::bot "$msg" 1>&2
  echo "Press any key to continue." 1>&2
  read
}

# usage:
#     tui::die "death message"
tui::die() {
  (>&2 echo "$@")
  exit 1
}

# usage:
#     tui::error "error message"
tui::error() {
  local msg="${1:-}"
  echo::red "[error] ${msg}" 1>&2
}

# usage:
#     tui::info "info message"
tui::info() {
  local msg="${1:-}"
  echo::cyan "[info] ${msg}" 1>&2
}

# usage:
#     tui::line
tui::line() {
  __echo "---------------------------------------------------------------------------"
}

# usage:
#     tui::ok "optional message"
tui::ok() {
  local msg="${1:-}"
  echo::green "[ok] ${msg}" 1>&2
}

# usage:
#     tui::running "running message"
tui::running() {
  local msg="${1:-}"
  echo::magenta " ⇒ ${msg}: " 1>&2
}

# usage:
#     tui::warn "warning message"
tui::warn() {
  local msg="${1:-}"
  echo::yellow "[warning] ${msg}" 1>&2
}
