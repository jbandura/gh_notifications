defmodule CliTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  import GhNotifications.CLI, only: [ parse_args: 1, process: 1 ]

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

  test "it returns proper notifications count when correct token passed" do
    process_output = fn ->
      process({"GOOD_TOKEN"})
    end

    assert capture_io(process_output) == "N: 1\n"
  end

  test "it returns meaningful error when token invalid" do
    process_output = fn ->
      process({"BAD_TOKEN"})
    end
    assert capture_io(process_output) == "Invalid access token.\n"
  end
end
