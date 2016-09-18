defmodule CliTest do
  use ExUnit.Case

  import GhNotifications.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--h", "anything"]) == :help
  end

  test "token returned if token given" do
    assert parse_args(["token"]) == { "token" }
  end

  test "if no token given help is shown" do
    assert parse_args([""]) == :help
  end
end
