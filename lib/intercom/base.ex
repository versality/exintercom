defmodule ExIntercom.Base do
  @items_per_page 20

  def request(url) do
    {:ok, response} = HTTPoison.get(url, headers, authenticate)
    response.body
  end

  def paginate_params(endpoint, pages) do
    endpoint <> "?per_page=#{@items_per_page}&page=#{pages}"
  end

  defp authenticate do
    [
      hackney: [
        basic_auth: {
          Application.fetch_env!(:exintercom, :intercom_app_id),
          Application.fetch_env!(:exintercom, :intercom_app_key)
        }
      ]
    ]
  end

  defp headers do
    [{"accept", "application/json"}]
  end
end
