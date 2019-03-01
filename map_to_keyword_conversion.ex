defmodule MapToKeywordConversion do
  def convert_map_to_keyword(data) do
    Enum.map(data, fn {k, v} ->
      v =
        cond do
          is_map(v) -> convert_map_to_keyword(v)
          true -> v
        end

      {String.to_atom("#{k}"), v}
    end)
  end
end
