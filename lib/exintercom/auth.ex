defmodule ExIntercom.Auth do
  def app_id do
    Application.get_env(
      :exintercom,
      :app_id,
      System.get_env("INTERCOM_APP_ID")
    )
  end

  def app_key do
    Application.get_env(
      :exintercom,
      :app_key,
      System.get_env("INTERCOM_APP_KEY")
    )
  end

  def client_id do
    Application.get_env(
      :exintercom,
      :client_id,
      System.get_env("INTERCOM_CLIENT_ID")
    )
  end

  def client_secret do
    Application.get_env(
      :exintercom,
      :client_secret,
      System.get_env("INTERCOM_CLIENT_SECRET")
    )
  end
end
