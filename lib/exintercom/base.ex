defmodule ExIntercom.Base do
  @moduledoc """
    Abstract module for Intercom API endpoints
  """

  @items_per_page 20

  def request(url) do
    {:ok, response} = HTTPoison.get(url, headers, authenticate)
    response.body
  end

  def paginate_params(endpoint, page_num) do
    endpoint <> "?per_page=#{@items_per_page}&page=#{page_num}"
  end

  defp authenticate do
    [
      hackney: [
        basic_auth: {
          Auth.app_id,
          Auth.app_key
        }
      ]
    ]
  end

  defp headers do
    [{"accept", "application/json"}]
  end
end
