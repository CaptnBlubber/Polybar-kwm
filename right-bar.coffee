commands =
  battery: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto " +
            "| cut -f1 -d';'"
  time   : "date +\"%H:%M:%S\""
  wifi   : "/System/Library/PrivateFrameworks/Apple80211.framework/" +
            "Versions/Current/Resources/airport -I | " +
            "sed -e \"s/^ *SSID: //p\" -e d"
  date   : "date +\"%a %d %b\""
  volume : "osascript -e 'output volume of (get volume settings)'"
  cpu    : "ESC=`printf \"\e\"`; ps -A -r -o %cpu | awk '{s+=$1} END {printf(\"%05.2f\",s/8);}'"
  disk   : "df -H -l / | awk '/\\/.*/ { print $5 }'"

colors =
  black:   "#3B4252"
  red:     "#BF616A"
  green:   "#A3BE8C"
  yellow:  "#EBCB8B"
  blue:    "#81A1C1"
  magenta: "#B48EAD"
  cyan:    "#88C0D0"
  white:   "#D8DEE9"

command: "echo " +
          "$(#{commands.battery}):::" +
          "$(#{commands.time}):::" +
          "$(#{commands.wifi}):::" +
          "$(#{commands.volume}):::" +
          "$(#{commands.date}):::" +
          "$(#{commands.cpu}):::" +
          "$(#{commands.disk}):::" 

refreshFrequency: 1000

render: () ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />

  <div class="volume">
    <span class="volume-icon"></span>
    <span class="volume-output"></span>
  </div>
  <div class="cpu">
    <i class="fa fa-area-chart"></i>
    <span class="cpu-output"></span>
  </div>
  <div class="disk">
    <i class="fa fa-hdd-o"></i>
    <span class="disk-output"></span>
  </div>
  <div class="wifi">
    <i class="fa fa-wifi"></i>
    <span class="wifi-output"></span>
  </div>
  <div class="battery">
    <span class="battery-icon"></span>
    <span class="battery-output"></span>
  </div>
  <div class="date">
    <i class="fa fa-calendar"></i>
    <span class="date-output"></span>
  </div>
  <div class="time">
    <i class="fa fa-clock-o"></i>
    <span class="time-output"></span>
  </div>
  """

update: (output) ->
  output = output.split( /:::/g )

  battery = output[0]
  time    = output[1]
  wifi    = output[2]
  volume  = output[3]
  date    = output[4]
  cpu     = output[5]
  disk    = output[6]

  $(".battery-output") .text("#{battery}")
  $(".time-output")    .text("#{time}")
  $(".wifi-output")    .text("#{wifi}")
  $(".volume-output")  .text("#{volume}%")
  $(".date-output")    .text("#{date}")
  $(".cpu-output")     .text("#{cpu}%")
  $(".disk-output")    .text("#{disk}")

  @handleBattery(Number(battery.replace( /%/g, "")))
  @handleVolume(Number(volume))

handleBattery: ( percentage ) ->
  batteryIcon = switch
    when percentage <=  12 then "fa-battery-0"
    when percentage <=  25 then "fa-battery-1"
    when percentage <=  50 then "fa-battery-2"
    when percentage <=  75 then "fa-battery-3"
    when percentage <= 100 then "fa-battery-4"
  $(".battery-icon").html("<i class=\"fa #{batteryIcon}\"></i>")

handleVolume: (volume) ->
  volumeIcon = switch
    when volume ==   0 then "fa-volume-off"
    when volume <=  50 then "fa-volume-down"
    when volume <= 100 then "fa-volume-up"
  $(".volume-icon").html("<i class=\"fa #{volumeIcon}\"></i>")

style: """
  .battery
    color: #{colors.green}
  .time
    color: #{colors.magenta}
  .wifi
    color: #{colors.white}
  .volume
    color: #{colors.cyan}
  .date
    color: #{colors.yellow}
  .cpu
    color: #{colors.cyan}
  .volume
    color: #{colors.yellow}
  .disk
    color: #{colors.green}
  

  display: flex
  div
    margin-right: 8px

  top: 0px
  right: 0px
  font-family: 'SauceCodePro Nerd Font' 
  font-size: 14px
  font-smoothing: antialiasing
  z-index: 0
"""