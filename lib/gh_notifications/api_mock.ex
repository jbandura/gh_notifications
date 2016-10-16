defmodule GhNotifications.APIMock do
  def make_request(:get, "BAD_TOKEN"), do: create_response([], 401)
  def make_request(:get, "GOOD_TOKEN_NO_NOTIFICATIONS"), do: create_response([])
  def make_request(:get, "GOOD_TOKEN") do
    create_response([
      %{ "id" => "1", "reason" => "mention" },
      %{ "id" => "2", "reason" => "foo" }
    ])
  end
  def make_request(:get, "GOOD_TOKEN_NO_MENTIONS") do
    create_response([
      %{ "id" => "1", "reason" => "foo" },
      %{ "id" => "2", "reason" => "foo" }
    ])
  end


  defp create_response(content, status \\ 200) do
    {
      :ok,
      %{
        body: content,
        status_code: status
      }
    }
  end
end
