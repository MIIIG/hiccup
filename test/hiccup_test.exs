defmodule HiccupTest do
  use ExUnit.Case
  doctest Hiccup

  setup_all do
    list = [:div, [:p, "hello"], "world"]
    list2 = [:div, %{id: "mydiv"}, [:p, "hello"], "world"]
    list3 = [:html, [[:head, [:title, "Title"]], [:body, [[:h1, "Heading"], [:p, "Paragraph."]]]]]

    {:ok, list: list, list2: list2, list3: list3}
  end

  test "greets the world" do
    assert Hiccup.hello() == :world
  end

  test "html", state do
    assert Hiccup.render(state[:list]) == "<div><p>hello</p>world</div>"
  end

  test "html2", state do
    assert Hiccup.render(state[:list2]) ==
             "<div id=\"mydiv\"><p>hello</p>world</div>"
  end

  test "html3", state do
    assert Hiccup.render(state[:list3]) ==
             "<html><head><title>Title</title></head><body><h1>Heading</h1><p>Paragraph.</p></body></html>"
  end
end
