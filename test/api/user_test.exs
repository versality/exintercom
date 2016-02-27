defmodule ExIntercom.UserTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "getting user by ID" do
    use_cassette "user_by_id" do
      assert ExIntercom.User.find(id: "1")
    end
  end
end
