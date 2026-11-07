function prefix(keys)
  return "ctrl+b>" .. keys
end

rex.bind(prefix("v"), "pane.split", { direction = "right" })
rex.bind(prefix("-"), "pane.split", { direction = "down" })

rex.bind(prefix("c"), "client.tab.new")
rex.bind(prefix("n"), "client.tab.next")
rex.bind(prefix("p"), "client.tab.previous")

rex.bind(prefix("z"), "pane.zoom")
