defmodule ExIntercom do
  alias ExIntercom.Auth

  @doc """
    Returns OAuth URL
    https://developers.intercom.io/docs/api-summary#section-initiating-the-oauth-flow
  """
  @spec oauth_url(<<>>, <<>>) :: <<>>
  def oauth_url(state, redirect_url) do
    params = URI.encode_query(%{
      client_id: Auth.client_id,
      state: state,
      redirect_url: redirect_url
    })

    "https://app.intercom.io/oauth?#{params}"
  end
end
