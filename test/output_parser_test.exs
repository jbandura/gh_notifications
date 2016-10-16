defmodule OutputParserTest do
  use ExUnit.Case
  alias GhNotifications.OutputParser

  test "it correctly returns count of notifications" do
    response = [%{"id" => "1"}]

    notifications_count = OutputParser.notifications_count(response)
    assert notifications_count == 1
  end

  test "it correctly returns count of notifications and mentions" do
    response = [
      %{"id" => "1"},
      %{"id" => "2", "reason" => "mention"},
    ]

    notifications_count = OutputParser.notifications_count(response)
    assert notifications_count == 2
  end

  test "it correctly returns count of mentions" do
    response = [
      %{"id" => "1", "reason" => "foo"},
      %{"id" => "2", "reason" => "mention"},
      %{"id" => "3", "reason" => "mention"},
    ]

    assert OutputParser.mentions_count(response) == 2
  end
end
