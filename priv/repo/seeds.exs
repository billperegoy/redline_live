alias RedlineLive.Map

defmodule RedlineLive.Seed do
  def create_trails(names, region_ids, region) do
    names
    |> Enum.each(fn name ->
      %{name: name, region_id: region_ids[region]}
      |> Map.create_trail()
    end)
  end
end

regions = [
  %{abbreviation: "washington", name: "Mt. Washington and the Southern Ridges"},
  %{abbreviation: "northern_peaks", name: "The Northern Peaks and the Great Gulf"},
  %{abbreviation: "franconia", name: "The Franconia, Twins, and Willey Ranges"},
  %{abbreviation: "carrigain", name: "The Carrigain and Moat Ranges"},
  %{abbreviation: "cannon", name: "Cannon and Kinsman"},
  %{abbreviation: "moosilauke", name: "The Moosilauke Region"},
  %{abbreviation: "waterville_valley", name: "The Waterville Valley and Squam Lake Regions"},
  %{abbreviation: "chocorua", name: "Mt. Chocorua and the Eastern Sandwich Range"},
  %{abbreviation: "carter", name: "The Carter and Baldface Ranges"},
  %{abbreviation: "speckled", name: "Speckled Mtn. Region"},
  %{abbreviation: "mahoosuc", name: "The Mahoosuc Range Area"},
  %{abbreviation: "northern_nh", name: "Northern New Hampshire"}
]

region_ids =
  regions
  |> Enum.with_index()
  |> Enum.reduce(%{}, fn {elem, index}, acc ->
    {:ok, %{id: id}} =
      elem
      |> Elixir.Map.merge(%{position: index})
      |> Map.create_region()

    Elixir.Map.put(acc, elem.abbreviation, id)
  end)

["Tuckerman Ravine Trail", "Lion Head Trail"]
|> RedlineLive.Seed.create_trails(region_ids, "washington")

["Gulfside Trail", "Jefferson Loop"]
|> RedlineLive.Seed.create_trails(region_ids, "northern_peaks")
