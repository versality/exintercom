defmodule ExIntercom.OAuthTest do
  use ExUnit.Case, async: true

  setup do
    Application.put_env(:exintercom, :client_id, "789")
  end

  test "generating oauth uri" do
    params = URI.encode_query(%{
      client_id:    "789"
    })

    url = ExIntercom.OAuth.uri
    assert url === "https://app.intercom.io/oauth?#{params}"
  end

  test "generating oauth uri using redirect_url" do
    redirect_url   = "http://redirect_url.com"

    params = URI.encode_query(%{
      client_id:    "789",
      redirect_url: redirect_url
    })

    url = ExIntercom.OAuth.uri(redirect_url)
    assert url === "https://app.intercom.io/oauth?#{params}"
  end

  test "generating oauth uri using state and redirect_url" do
    redirect_url   = "http://redirect_url.com"
    state          = "test_state"

    params = URI.encode_query(%{
      client_id:    "789",
      redirect_url: redirect_url,
      state:        state
    })

    url = ExIntercom.OAuth.uri(redirect_url, state)
    assert url === "https://app.intercom.io/oauth?#{params}"
  end
end
