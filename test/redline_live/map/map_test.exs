defmodule RedlineLive.MapTest do
  use RedlineLive.DataCase

  alias RedlineLive.Map

  describe "trail" do
    test "attaches to region" do
      region = insert(:region)

      {:ok, trail} = Map.create_trail(%{name: "My Trail", region_id: region.id})
      trail = Repo.preload(trail, :region)

      assert trail.name == "My Trail"
      assert trail.region == region

      insert(:segment)
      |> IO.inspect()
    end
  end
end
