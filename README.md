# Hiccup

**Library: render html like hiccup. All objects is tuple basic type, if you want to render list of objects you can use list, properties is only maps. All data is currently represented like strings.**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hiccup` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hiccup, "~> 0.1.0"}
  ]
end
```
## You can try it in shell
```bash
➜  hiccup git:(main) ✗ iex -S mix
Erlang/OTP 26 [erts-14.0] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns]
Compiling 1 file (.ex)
Generated hiccup app
Interactive Elixir (1.14.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Hiccup.render({:div})
"<div></div>"
iex(2)> Hiccup.render({:div, %{id: "mydiv"}, "data"})
"<div id=\"mydiv\">data</div>"
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/hiccup>.

