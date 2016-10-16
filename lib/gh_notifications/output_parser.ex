defmodule GhNotifications.OutputParser do
  def notifications_count(notifications), do: length(notifications)

  def mentions_count(notifications) do
    notifications
      |> Enum.filter(fn(el) -> el.reason == "mention" end)
      |> length
  end
end
