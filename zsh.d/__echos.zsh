__echo() {
	echo -e "$*" 1>&2
}

# usage:
#     echo::bold "message"
echo::bold() {
	echo -e "${__clr_bold}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::black "message"
echo::black() {
	echo -e "${__clr_black}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::blue "message"
echo::blue() {
	echo -e "${__clr_blue}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::cyan "message"
echo::cyan() {
	echo -e "${__clr_cyan}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::dim "message"
echo::dim() {
	echo -e "${__clr_dim}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::green "message"
echo::green() {
	echo -e "${__clr_green}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::magenta "message"
echo::magenta() {
	echo -e "${__clr_magenta}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::red "message"
echo::red() {
	echo -e "${__clr_red}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::reverse "message"
echo::reverse() {
	echo -e "${__clr_rev}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::standout "message"
echo::standout() {
	echo -e "${__clr_smso}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::underline "message"
echo::underline() {
	echo -e "${__clr_smul}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::white "message"
echo::white() {
	echo -e "${__clr_white}$*${__clr_reset}" 1>&2
}

# usage:
#     echo::yellow "message"
echo::yellow() {
	echo -e "${__clr_yellow}$*${__clr_reset}" 1>&2
}

# Display seconds in human readable fromat
# Based on http://stackoverflow.com/a/32164707/3859566
# USAGE:
#   echo::displaytime <seconds>
echo::displaytime() {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd ' $D
  [[ $H > 0 ]] && printf '%dh ' $H
  [[ $M > 0 ]] && printf '%dm ' $M
  printf '%ds' $S
}
