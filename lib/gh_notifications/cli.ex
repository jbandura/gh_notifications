defmodule GhNotifications.CLI do
  @moduledoc """
  Handle the command line parsing and the dispatch of various
  functions that fetch the last notifications/mentions from
  github
  """

  def run(argv) do
    argv
      |> parse_args
      |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean],
                                     aliases:  [h: :help      ])
    case parse do
      { [help: true ], _, _ } -> :help
      { _, [""], _ } -> :help
      { _, [token], _ } -> { token }
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: gh_notifcations <GITHUB_API_TOKEN>
    """
    System.halt(0)
  end

  def process({token}) do
    IO.puts """
    token
    """
  end
end
