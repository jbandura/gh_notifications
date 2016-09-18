defmodule NotificationsTest do
  use ExUnit.Case
  alias GhNotifications.Notifications

  test "retrieving notifications" do
    assert {:ok, response } = Notifications.all("8d43b708e315227a142132d0557e3b70da8b1fd9")
  end
end
