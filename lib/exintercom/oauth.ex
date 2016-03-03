defmodule ExIntercom.OAuth do
  @moduledoc """
  Provides helper methods for Intercom OAuth

  https://developers.intercom.io/docs/api-summary#section-initiating-the-oauth-flow
  """

  @doc """
    Returns OAuth URL
  """
  @spec uri :: <<>>
  def uri do
    params = URI.encode_query(%{
      client_id: ExIntercom.Auth.client_id
    })

    url_with_params(params)
  end

  @doc """
    Returns OAuth URL with redirect_url
  """
  @spec uri(<<>>) :: <<>>
  def uri(redirect_url) do
    params = URI.encode_query(%{
      client_id: ExIntercom.Auth.client_id,
      redirect_url: redirect_url
    })

    url_with_params(params)
  end

  @doc """
    Returns OAuth URL with redirect_url and state
  """
  @spec uri(<<>>, <<>>) :: <<>>
  def uri(redirect_url, state) do
    params = URI.encode_query(%{
      client_id: ExIntercom.Auth.client_id,
      state: state,
      redirect_url: redirect_url
    })

    url_with_params(params)
  end

  defp url_with_params(params) do
    "https://app.intercom.io/oauth?#{params}"
  end
end
