commands =
  active : "/usr/local/bin/kwmc query space active id"
  list   : "/usr/local/bin/kwmc query space list"
  monitor: ""

colors =
  acqua:   "#00d787"
  wine:    "#72003e"
  orange:  "#ff8700"
  silver:  "#e4e4e4"
  elegant: "#1C2331"
  magenta: "#af005f"
  cyan:    "#00afd7"

command: "echo " +
          "$(#{commands.active}):::" +
          "$(#{commands.list}):::" 

refreshFrequency: 1000

render: () ->
  """
  <link rel="stylesheet" href="./polybar/assets/font-awesome/css/font-awesome.min.css" />

  <ul class="spaces">
    <li>1: Default</li>
  </ul>
  """

update: (output) ->
  output = output.split( /:::/g )

  active = output[0]
  list   = output[1]

  @handleSpaces(list)
  @handleActiveSpace(Number (active))

handleSpaces: (list) ->
  $(".spaces").empty()
  list = list.split(/\d, /g)
  $.each(list, (index, value) -> 
    if (index > 0)
      $("<li>").prop("id", index).text("#{index}: #{value}").appendTo(".spaces")
  )
 
handleActiveSpace: (id) ->
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
  z-index: 0
"""