defmodule ExIntercom.Base do
  @moduledoc """
  Abstract module for Intercom API endpoints
  """

  alias ExIntercom.Auth
  @items_per_page 20

  @doc """
  Performs request to specified Intercom endpoint with authentication.
  Will raise an exception if credentials are invalid.

  Returns undecoded body.
  """
  @spec request(<<>>) :: <<>>
  def request(url) do
    {:ok, response} = HTTPoison.get(url, headers, authenticate)
    ensure_auth(response)
  end

  @doc """
  Adds pagination to an endpoint.
  """
  @spec paginate_params(<<>>, <<>>) :: <<>>
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

  defp ensure_auth(response) do
    body = response.body |> Poison.decode!

    if Map.has_key?(body, "errors") do
      errors      = body["errors"]
      first_error = List.first(errors)

      if first_error["message"] === "Unauthorized" do
        raise "AuthError: #{first_error["code"]}"
      end
    end

    response.body
  end
end
