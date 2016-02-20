defmodule Rumbl.Permalink do
  @behaviour Ecto.Type

  def type, do: :id

  def cast(binary) when is_binary(binary) do
    # parse the first part of the :id parameter to extract the integer
    case Integer.parse(binary) do
      #if it matches, return it
      {int, _} when int > 0 -> {:ok, int}
      _ -> :error
    end
  end

  def cast(integer) when is_integer(integer) do
    {:ok, integer}
  end

  def cast(_) do
    :error
  end

  def dump(integer) when is_integer(integer) do
    {:ok, integer}
  end

  def load(integer) when is_integer(integer) do
    {:ok, integer}
  end
end

