defmodule ExIntercom.AdminTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "getting list of admins" do
    use_cassette "all_admins" do
      assert ExIntercom.Admin.all
    end
  end
end
