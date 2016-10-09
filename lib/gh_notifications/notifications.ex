defmodule GhNotifications.Notifications do
  @gh_api Application.get_env(:gh_notifications, :api)

  def all(token) do
    handle_response(@gh_api.make_request(:get, token))
  end

  defp handle_response({ _, %{ body: response_body, status_code: 200 }}) do
    { :ok, %{ body: response_body } }
  end
  defp handle_response({ _, %{ body: _, status_code: 401 } }) do
    { :error, {} }
  end
end
