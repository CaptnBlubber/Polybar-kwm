commands =
  active : "/usr/local/bin/chunkc tiling::query --desktop id"

colors =
  acqua:   "#00d787"
  wine:    "#72003e"
  orange:  "#ff8700"
  silver:  "#e4e4e4"
  elegant: "#1C2331"
  magenta: "#af005f"
  cyan:    "#00afd7"

spaces = [" Private", " Web", " Chat", " Code", " Musik", " Terminal", " Mail"]

command: "echo $(#{commands.active})"

refreshFrequency: 1000

render: () ->
  """
  <link rel="stylesheet" href="./polybar/assets/font-awesome/css/font-awesome.min.css" />
    <li id="1">1:  Private</li>
    <li id="2">2:  Web</li>
    <li id="3">3:  Chat</li>
    <li id="4">4:  Code</li>
    <li id="5">5:  Musik</li>
    <li id="6">6:  Terminal</li>
    <li id="7">7:  Mail</li>
  <ul class="spaces">
  </ul>
  """

update: (output) ->
  @handleActiveSpace(Number (output))

handleActiveSpace: (id) ->
  $(".active").removeClass("active")
  $("##{id}").addClass("active")

style: """
  .active
    color: #{colors.elegant}
    background: #{colors.silver}
    border: 1px solid #{colors.silver}
  
  .spaces
    display: flex
    
  .workspace
    color: #{colors.orange}
    background: #{colors.elegant}
    border: 1px solid #{colors.elegant}

  .spaces
    padding-right: 8px
    padding-left: 8px

  ul
    list-style: none
    margin: 0 0 0 8px
    padding: 0
  
  li
    display: inline
    padding: 2px 8px
    color: #{colors.orange}
    background: #{colors.elegant}
    border: 1px solid #{colors.elegant}

  top: 0px
  left: 0px
  font-family: 'SauceCodePro Nerd Font' 
  font-size: 14px
  font-smoothing: antialiasing
  z-index: 1
"""