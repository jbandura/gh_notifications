defmodule GhNotifications.CLI do
  alias GhNotifications.Notifications

  @moduledoc """
  Handle the command line parsing and the dispatch of various
  functions that fetch the last notifications/mentions from
  github
  """

  def main(argv) do
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
    process_response(Notifications.all(token))
  end

  defp process_response({:ok, %{body: notifications}}) do
    IO.puts "N: #{length(notifications)}"
  end

  defp process_response({:error, _}) do
    IO.puts "Invalid access token."
  end
end
