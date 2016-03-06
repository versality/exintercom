defmodule ExIntercom.Admin do
  @moduledoc """
  Wrapper around Intercom Admins endpoint
  """

  import ExIntercom.Base

  @endpoint "https://api.intercom.io/admins/"

  @doc """
  Returns all admins
  """
  @spec all :: %{}
  def all do
    fetch(@endpoint)
  end

  defp fetch(url) do
    url |> request |> Poison.decode!
  end
end
