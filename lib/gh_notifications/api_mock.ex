defmodule GhNotifications.APIMock do
  def make_request(:get, "GOOD_TOKEN") do
    {
      :ok,
      %{
        body: [
          %{ id: 1 }
        ],
        status_code: 200
      }
    }
  end

  def make_request(:get, "BAD_TOKEN") do
    {
      :ok,
      %{
        body: [],
        status_code: 401
      }
    }
  end
end
