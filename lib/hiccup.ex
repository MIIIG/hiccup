defmodule Hiccup do
  @moduledoc """
  Documentation for `Hiccup`.
  """

  @doc """
  Hiccup like html render(honestly maybe like hiccup)

  """
  def hello do
    :world
  end

  # "<div id="mydiv"><p>hello</p>world</div>"
  # [:div, %{:id "mydiv"}, [:p, "hello"], "world"]

  # "<div><p>hello</p>world</div>"
  # [:div, [:p, "hello"], "world"]

  # <html><head><title>Title</title></head><body><h1>Heading</h1><p>Paragraph.</p></body></html>
  # [:html, [[:head, [:title, "Title"]],[:body, [[:h1, "Heading"],[:p, "Paragraph."]]]]]

  def render(list) do
    object(list)
  end

  def object([name, properties, childs, data]) do
    props = props(properties)
    objects = object(childs)
    "<#{name}#{props}>#{objects}#{data}</#{name}>"
  end

  def object([name, properties, childs]) when is_list(childs) do
    str = props(properties)
    objects = object(childs)
    "<#{name}#{str}>#{objects}</#{name}>"
  end

  def object([name, childs, data]) when is_list(childs) do
    objects = object(childs)
    "<#{name}>#{objects}#{data}</#{name}>"
  end

  def object([name, properties, data]) when is_bitstring(data) do
    str = props(properties)
    "<#{name}#{str}>#{data}</#{name}>"
  end

  def object([name, childs]) when is_list(childs) do
    objects = object(childs)
    "<#{name}>#{objects}</#{name}>"
  end

  def object([name, data]) when is_bitstring(data) do
    "<#{name}>#{data}</#{name}>"
  end

  def object([name]) do
    "<#{name}></#{name}>"
  end

  def props(props) do
    Enum.reduce(props, "", fn {k, v}, acc ->
      acc <> " #{k}=\"#{v}\""
    end)
  end
end
