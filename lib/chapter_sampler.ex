defmodule ChapterSampler do
  alias ChapterSampler.Shortener

  def main(_args) do
    raw = IO.read(:stdio, :all)
    [meta, blocks] = Poison.decode!(raw)
    result = [meta, Shortener.shorten(blocks)]
    IO.puts Poison.encode!(result)
  end
end
