defmodule GhNotifications.CLI do
  @moduledoc """
  Handle the command line parsing and the dispatch of various
  functions that fetch the last notifications/mentions from
  github
  """

  def run(argv) do
    parse_args(argv)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean],
                                     aliases:  [h: :help      ])
    case parse do
      { [help: true ], _, _ } -> :help
      { _, [token], _ } -> { token }
      _ -> :help
    end
  end
end
