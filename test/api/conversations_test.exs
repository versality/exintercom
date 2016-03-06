defmodule ExIntercom.ConversationTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "getting list of conversations" do
    use_cassette "all_conversations" do
      assert ExIntercom.Conversation.find_all
    end
  end

  test "getting conversation by ID" do
    use_cassette "conversation_by_id" do
      assert ExIntercom.Conversation.find(id: "1")
    end
  end
end
