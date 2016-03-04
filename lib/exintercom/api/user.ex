defmodule ExIntercom.User do
  @moduledoc """
  Wrapper around Intercom Users endpoint
  """

  import ExIntercom.Base

  @endpoint "https://api.intercom.io/users/"

  @doc """
  Returns single user by its ID
  """
  @spec find([id: <<>>]) :: %{}
  def find(id: id) do
    fetch(@endpoint <> to_string(id))
  end

  defp fetch(url) do
    url |> request |> Poison.decode!
  end
end
