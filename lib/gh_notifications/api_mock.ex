defmodule GhNotifications.APIMock do
  def make_request(:get, _) do
    {:ok, %{ body: [%{ id: 1 }] }}
  end
end
