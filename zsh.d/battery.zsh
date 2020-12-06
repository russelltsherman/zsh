#
# Battery
#

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::battery() {
  IMPROMPTU_BATTERY_SHOW="always"
  IMPROMPTU_BATTERY_PREFIX=" "
  IMPROMPTU_BATTERY_SUFFIX=" "
  IMPROMPTU_BATTERY_SYMBOL_CHARGING="⇡"
  IMPROMPTU_BATTERY_SYMBOL_DISCHARGING="⇣}"
  IMPROMPTU_BATTERY_SYMBOL_FULL="•"
  IMPROMPTU_BATTERY_THRESHOLD="10"

  [[ "$IMPROMPTU_BATTERY_SHOW" == "false" ]] && return

  local battery_data 
  local battery_percent 
  local battery_status 
  local battery_color

  if chk::command pmset
  then
    battery_data=$(pmset -g batt | grep "InternalBattery")

    # Return if no internal battery
    [[ -z "$battery_data" ]] && return

    battery_percent="$( echo $battery_data | grep -oE '[0-9]{1,3}%' )"
    battery_status="$( echo $battery_data | awk -F '; *' 'NR==2 { print $2 }' )"
  elif chk::command acpi
  then
    battery_data=$(acpi -b 2>/dev/null | head -1)

    # Return if no battery
    [[ -z $battery_data ]] && return

    battery_percent="$( echo $battery_data | awk '{print $4}' )"
    battery_status="$( echo $battery_data | awk '{print tolower($3)}' )"
  elif chk::command upower
  then
    local battery=$(command upower -e | grep battery | head -1)

    # Return if no battery
    [[ -z $battery ]] && return

    battery_data=$(upower -i $battery)
    battery_percent="$( echo "$battery_data" | grep percentage | awk '{print $2}' )"
    battery_status="$( echo "$battery_data" | grep state | awk '{print $2}' )"
  else
    return
  fi

  # Remove trailing % and symbols for comparison
  battery_percent="$(echo $battery_percent | tr -d '%[,;]')"

  # Change color based on battery percentage
  if [[ $battery_percent == 100 || $battery_status =~ "(charged|full)" ]]
  then
    battery_color="green"
  elif [[ $battery_percent -lt $IMPROMPTU_BATTERY_THRESHOLD ]]
  then
    battery_color="red"
  else
    battery_color="yellow"
  fi

  # Battery indicator based on current status of battery
  if [[ $battery_status == "charging" ]]
  then
    battery_symbol="${IMPROMPTU_BATTERY_SYMBOL_CHARGING}"
  elif [[ $battery_status =~ "^[dD]ischarg.*" ]]
  then
    battery_symbol="${IMPROMPTU_BATTERY_SYMBOL_DISCHARGING}"
  else
    battery_symbol="${IMPROMPTU_BATTERY_SYMBOL_FULL}"
  fi

  # Escape % for display since it's a special character in Zsh prompt expansion
  if [[ $IMPROMPTU_BATTERY_SHOW == 'always' ||
        $battery_percent -lt $IMPROMPTU_BATTERY_THRESHOLD ||
        $IMPROMPTU_BATTERY_SHOW == 'charged' && $battery_status =~ "(charged|full)" ]]
  then
    impromptu::segment "$battery_color" \
      "${IMPROMPTU_BATTERY_PREFIX}${battery_symbol}${battery_percent}%%$IMPROMPTU_BATTERY_SUFFIX"
  fi
}
