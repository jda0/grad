window.heightmap = () ->
  me = @

  @dom = document.querySelector '.main'
  @data = []
  @size = {x: 15, y:15}

  @init = () ->
    me.data = []
    for j in [0..me.size.y]
      me.data.push []
      for i in [0..me.size.x]
        me.data[j].push undefined

  @build = (start) ->
    me.init()

    me.data[0][0] = start

    for i in [1..me.size.x]
      me.data[0][i] = me.data[0][i-1] + Math.floor Math.random() * 1.49 - 0.24

    for j in [1..me.size.y]
      me.data[j][0] = me.data[j-1][0] + Math.floor Math.random() * 1.49 - 0.24

    for j in [1..me.size.y]
      for i in [1..me.size.x]
        if Math.abs(me.data[j][i-1] - me.data[j-1][i]) is 2 then me.data[j][i] = me.data[j-1][i-1]
        else if me.data[j][i-1] is me.data[j-1][i] then me.data[j][i] = me.data[j][i-1] + Math.floor Math.random() * 1.49 - 0.24
        else
          a = Math.floor Math.random() * 1.99
          me.data[j][i] = me.data[j-a][i+a-1]

    console.log 'Built'

  @render = () ->
    htm = '<table>'
    for j in me.data
      htm += '<tr>'
      for i in j
        htm += '<td>' + i + '</td>'
      htm += '</tr>'
    htm += '</table>'

    me.dom.innerHTML = htm

  return @

h = new window.heightmap()
h.build(50)
h.render()