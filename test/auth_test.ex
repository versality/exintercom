defmodule ExIntercom.AuthTest do
  use ExUnit.Case, async: true

  test "getting config variables" do
    Application.put_env(:exintercom, :app_id, "123")
    Application.put_env(:exintercom, :app_key, "456")
    Application.put_env(:exintercom, :client_id, "789")
    Application.put_env(:exintercom, :client_secret, "012")

    assert ExIntercom.Auth.app_id        === "123"
    assert ExIntercom.Auth.app_key       === "456"
    assert ExIntercom.Auth.client_id     === "789"
    assert ExIntercom.Auth.client_secret === "012"
  end

  test "getting env variables" do
    Application.delete_env(:exintercom, :app_id)
    Application.delete_env(:exintercom, :app_key)
    Application.delete_env(:exintercom, :client_id)
    Application.delete_env(:exintercom, :client_secret)

    System.put_env("INTERCOM_APP_ID", "111")
    System.put_env("INTERCOM_APP_KEY", "222")
    System.put_env("INTERCOM_CLIENT_ID", "333")
    System.put_env("INTERCOM_CLIENT_SECRET", "444")

    assert ExIntercom.Auth.app_id        === "111"
    assert ExIntercom.Auth.app_key       === "222"
    assert ExIntercom.Auth.client_id     === "333"
    assert ExIntercom.Auth.client_secret === "444"
  end
end
