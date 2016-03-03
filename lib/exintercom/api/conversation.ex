defmodule ExIntercom.Conversation do
  @moduledoc """
  Wrapper around Intercom Conversations endpoint
  """

  import ExIntercom.Base

  @endpoint "https://api.intercom.io/conversations/"

  @doc """
    Returns map of all conversations
  """
  @spec find_all :: [%{}, ...]
  def find_all do
    total_pages |> through_pages([])
  end

  @doc """
    Returns single conversation
  """
  @spec find([{:atom, integer}]) :: %{}
  def find(id: id) do
    fetch(@endpoint <> to_string(id))
  end

  defp fetch(url) do
    url |> request |> Poison.decode!
  end

  defp through_pages(0, tasks) do
    Enum.reduce(tasks, &(Task.await(&1) ++ &2))
  end

  defp through_pages(pages, tasks) do
    task = Task.async(fn ->
      url       = paginate_params(@endpoint, pages)
      page_body = fetch(url)
      page_body["conversations"]
    end)

    through_pages(pages - 1, tasks ++ [task])
  end

  defp total_pages do
    page_body = fetch(@endpoint)
    page_body["pages"]["total_pages"]
  end
end
