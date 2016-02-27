defmodule ExIntercom.User do
  @moduledoc """
    Wrapper around ExIntercom Users endpoint
  """

  import ExIntercom.Base

  @endpoint "https://api.intercom.io/users/"

  def find(id: id) do
    request(@endpoint <> to_string(id))
  end
end
