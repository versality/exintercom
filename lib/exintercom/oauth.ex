defmodule ExIntercom.OAuth do
  @moduledoc """
  Provides helper methods for Intercom OAuth
  """

  @doc """
    Returns OAuth URL
    https://developers.intercom.io/docs/api-summary#section-initiating-the-oauth-flow
  """
  @spec uri :: <<>>
  def uri do
    params = URI.encode_query(%{
      client_id: ExIntercom.Auth.client_id
    })

    "https://app.intercom.io/oauth?#{params}"
  end

  @doc """
    Returns OAuth URL using redirect_url
    https://developers.intercom.io/docs/api-summary#section-initiating-the-oauth-flow
  """
  @spec uri(<<>>) :: <<>>
  def uri(redirect_url) do
    params = URI.encode_query(%{
      client_id: ExIntercom.Auth.client_id,
      redirect_url: redirect_url
    })

    "https://app.intercom.io/oauth?#{params}"
  end

  @doc """
    Returns OAuth URL using redirect_url and state
    https://developers.intercom.io/docs/api-summary#section-initiating-the-oauth-flow
  """
  @spec uri(<<>>, <<>>) :: <<>>
  def uri(redirect_url, state) do
    params = URI.encode_query(%{
      client_id: ExIntercom.Auth.client_id,
      state: state,
      redirect_url: redirect_url
    })

    "https://app.intercom.io/oauth?#{params}"
  end
end
