defmodule NotificationsTest do
  use ExUnit.Case
  alias GhNotifications.Notifications

  test "retrieving notifications with proper token" do
    { status, response } = Notifications.all("GOOD_TOKEN")
    assert status == :ok
    assert length(response.body) == 2
  end

  test "retrieving notifications with wrong token" do
    { status, _ } = Notifications.all("BAD_TOKEN")
    assert status == :error
  end
end
