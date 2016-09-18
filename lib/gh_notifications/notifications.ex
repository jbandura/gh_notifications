defmodule GhNotifications.Notifications do
  @gh_api Application.get_env(:gh_notifications, :api)

  def all(token) do
    @gh_api.make_request(:get, token)
  end
end
