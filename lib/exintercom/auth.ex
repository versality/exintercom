defmodule ExIntercom.Auth do
  @moduledoc """
  Provides functions to access credentials related to Intercom
  Will first try to access config env, if not available read system env
  """

  @doc """
  Returns Intercom app_id specified either in config or env
  """
  @spec app_id :: <<>>
  def app_id do
    Application.get_env(
      :exintercom,
      :app_id,
      System.get_env("INTERCOM_APP_ID")
    )
  end

  @doc """
  Returns Intercom app_key specified either in config or env
  """
  @spec app_key :: <<>>
  def app_key do
    Application.get_env(
      :exintercom,
      :app_key,
      System.get_env("INTERCOM_APP_KEY")
    )
  end

  @doc """
  Returns Intercom client_id specified either in config or env
  """
  @spec client_id :: <<>>
  def client_id do
    Application.get_env(
      :exintercom,
      :client_id,
      System.get_env("INTERCOM_CLIENT_ID")
    )
  end

  @doc """
  Returns Intercom client_secret specified either in config or env
  """
  @spec client_secret :: <<>>
  def client_secret do
    Application.get_env(
      :exintercom,
      :client_secret,
      System.get_env("INTERCOM_CLIENT_SECRET")
    )
  end
end
