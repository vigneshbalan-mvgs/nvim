return {
  dir = "~/git/ripreplace",       -- path to your local plugin
  config = function()
    require("ripreplace").setup() -- call the `hello` function when loading the plugin
  end,
}
