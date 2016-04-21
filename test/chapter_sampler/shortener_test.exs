defmodule ChapterSampler.ShortenerTest do
  use ExUnit.Case, async: true

  test "returns the first half of the chapter by counting headers" do
    assert ChapterSampler.Shortener.shorten(input) == output
  end

  def input do
    [
      %{
        "c" =>
          [
            2,
            ["requirements", [], []],
            [%{"c" => "Requirements", "t" => "Str"}]
          ],
        "t" => "Header"
      },
     %{
        "c" => [%{"c" => "As", "t" => "Str"}],
        "t" => "Para"
      },
     %{
        "c" =>
          [
            2,
            ["form-object", [], []],
            [%{"c" => "Form", "t" => "Str"}]
          ],
        "t" => "Header"
      },
     %{
        "c" => [%{"c" => "Something", "t" => "Str"}],
        "t" => "Para"
      }
    ]
  end

  def output do
    [
      %{
        "c" =>
          [
            2,
            ["requirements", [], []],
            [%{"c" => "Requirements", "t" => "Str"}]
          ],
        "t" => "Header"
      },
     %{
        "c" => [%{"c" => "As", "t" => "Str"}],
        "t" => "Para"
      }
    ]
  end
end
