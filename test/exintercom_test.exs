defmodule ExIntercomTest do
  use ExUnit.Case, async: true

  test "generating oauth url" do
    Application.put_env(:exintercom, :client_id, "789")

    redirect_url   = "http://redirect_url.com"
    state          = "test_state"

    params = URI.encode_query(%{
      client_id:    "789",
      redirect_url: redirect_url,
      state:        state
    })

    url = ExIntercom.oauth_url(redirect_url, state)
    assert url === "https://app.intercom.io/oauth?#{params}"
  end
end
