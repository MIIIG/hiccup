defmodule Hiccup do
  @moduledoc """
  Documentation for `Hiccup`.
  """

  @doc """
  Hiccup like html render(honestly maybe like hiccup)

  """

  # Render html

  @spec render(list :: Tuple.t()) :: String.t() | {:error, :render_error}
  def render(list) do
    try do
      object(list)
    catch
      :error, _ -> {:error, :render_error}
    end
  end

  # Working with object

  defp object({name}) when is_atom(name) do
    "<#{name}></#{name}>"
  end

  defp object({name, properties, childs, data}) do
    props = props(properties)
    objects = objects(childs)
    "<#{name}#{props}>#{objects}#{data}</#{name}>"
  end

  defp object({name, childs, data}) when is_list(childs) do
    objects = objects(childs)
    "<#{name}>#{objects}#{data}</#{name}>"
  end

  defp object({name, child, data}) when is_tuple(child) do
    object = object(child)
    "<#{name}>#{object}#{data}</#{name}>"
  end

  defp object({name, properties, data}) when is_bitstring(data) do
    str = props(properties)
    "<#{name}#{str}>#{data}</#{name}>"
  end

  defp object({name, properties, childs}) do
    str = props(properties)
    objects = objects(childs)
    "<#{name}#{str}>#{objects}</#{name}>"
  end

  defp object({name, data}) when is_bitstring(data) do
    "<#{name}>#{data}</#{name}>"
  end

  defp object({name, properties}) when is_map(properties) do
    str = props(properties)
    "<#{name}#{str}></#{name}>"
  end

  defp object({name, child}) when is_tuple(child) do
    object = object(child)
    "<#{name}>#{object}</#{name}>"
  end

  defp object({name, childs}) do
    childs = objects(childs)
    "<#{name}>#{childs}</#{name}>"
  end

  # Working with list of objects

  defp objects({name, child}) when is_bitstring(child), do: object({name, child})

  defp objects({name, child}) when is_tuple(child) do
    object = object(child)
    "<#{name}>#{object}</#{name}>"
  end

  defp objects(arg) when is_list(arg), do: Enum.map(arg, &object/1)

  # Working with properties

  defp props(props) do
    Enum.reduce(props, "", fn {k, v}, acc ->
      acc <> " #{k}=\"#{v}\""
    end)
  end
end
