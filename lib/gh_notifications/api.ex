defmodule GhNotifications.API do
  use HTTPoison.Base
  @url "https://api.github.com/notifications"

  def make_request(:get, token) do
    get(@url, %{
      "Authorization" => "token #{token}"
    })
  end

  # HTTPosion Hooks

  def process_response_body(body) do
    body |> Poison.decode!
  end
end
