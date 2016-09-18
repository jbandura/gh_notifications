defmodule GhNotifications.APIMock do
  def make_request(:get, token) do
    {:ok, {}}
  end
end
