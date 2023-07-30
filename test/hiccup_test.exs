defmodule HiccupTest do
  use ExUnit.Case

  setup_all do
    list = {:div, {:p, "hello"}, "world"}
    list2 = {:div, %{id: "mydiv"}, {:p, "hello"}, "world"}
    list3 = {:html, [{:head, {:title, "Title"}}, {:body, [{:h1, "Heading"}, {:p, "Paragraph."}]}]}
    list4 = {:span}

    {:ok, list: list, list2: list2, list3: list3, list4: list4}
  end

  test "div with p and data", state do
    assert Hiccup.render(state[:list]) == "<div><p>hello</p>world</div>"
  end

  test "div with p and properties", state do
    assert Hiccup.render(state[:list2]) ==
             "<div id=\"mydiv\"><p>hello</p>world</div>"
  end

  test "html", state do
    assert Hiccup.render(state[:list3]) ==
             "<html><head><title>Title</title></head><body><h1>Heading</h1><p>Paragraph.</p></body></html>"
  end

  test "span", state do
    assert Hiccup.render(state[:list4]) == "<span></span>"
  end
end
