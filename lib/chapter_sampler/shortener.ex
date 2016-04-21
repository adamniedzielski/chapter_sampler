defmodule ChapterSampler.Shortener do
  def shorten(blocks) do
    if count_of_breakpoints(blocks) > 1 do
      Enum.take_while(
        blocks,
        &(&1 != first_heading_which_should_be_dropped(blocks))
      )
    else
      blocks
    end
  end

  defp first_heading_which_should_be_dropped(blocks) do
    index =
      blocks |>
      count_of_breakpoints |>
      divide_by_two |>
      Float.ceil |>
      round
    blocks |> breakpoints |> Enum.fetch!(index)
  end

  defp count_of_breakpoints(blocks) do
    blocks |> breakpoints |> Enum.count
  end

  defp breakpoints(blocks) do
    Enum.filter(blocks, &second_level_heading?/1)
  end

  defp second_level_heading?(%{"t" => "Header", "c" => [level, _, _]}) do
    level == 2
  end

  defp second_level_heading?(_) do
    false
  end

  defp divide_by_two(value) do
    value / 2
  end
end
