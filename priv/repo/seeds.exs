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
  %{abbreviation: "waterville", name: "The Waterville Valley and Squam Lake Regions"},
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

[
  "Tuckerman Ravine Trail",
  "Lion Head Trail",
  "Huntington Ravine Trail",
  "Nelson Crag Trail",
  "Boott Spur Trail",
  "Boott Spur Link",
  "Glen Boulder Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "washington")

[
  "Gulfside Trail",
  "Jefferson Loop",
  "Mt. Clay Loop",
  "Edmonds Col Cutoff",
  "The Cornice",
  "Randolph Path",
  "The Link"
]
|> RedlineLive.Seed.create_trails(region_ids, "northern_peaks")

[
  "Franconia Ridge Trail",
  "Flume Slide Trail",
  "Liberty Spring Trail",
  "Whitehouse Trail",
  "Falling Waters Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "franconia")

[
  "Signal Ridge Trail",
  "Carrigain Notch Trail",
  "Desolation Trail",
  "Nancy Pond Trail",
  "Ceder Brook Trail",
  "Hancock Notch Trail",
  "Hancock Loop Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "carrigain")

[
  "Kinsman Ridge Trail",
  "Veterans Trail",
  "Lonesome Lake Trail",
  "Around-Lonesome-Lake Trail",
  "Hi-Cannon Trail",
  "Dodge Cutoff",
  "Pemi Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "cannon")

[
  "Beaver Brook Trail",
  "Tunnel Brook Trail",
  "Benton Trail",
  "Glencliff Trail",
  "Town Line Trail",
  "Hurricane Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "moosilauke")

[
  "Mt. Tecumseh Trail",
  "Sosman Trail",
  "Welch-Dickey Loop Trail",
  "Timber Camp Trail",
  "Goodrich Rock Trail",
  "Flume Brook Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "waterville")

[
  "Champney Falls Trail",
  "White Ledge Loop Trail",
  "Carter Ledge Trail",
  "Middle Sister Trail",
  "Piper Trail",
  "Nickerson Ledge Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "chocorua")

[
  "Wildcat Ridge Trai",
  "Lost Pind Trail",
  "Square Ledge Trail",
  "Thompson Falls Trail",
  "Carter-Moriah Trail",
  "Nineteen-Mile Brook Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "carter")

[
  "Roost Trail",
  "Wheeler Brook Trail",
  "Caribou Trail",
  "Mud Brook Trail",
  "Haystack Notch Trail",
  "Albany Mtn . Trail",
  "Albany Brook Trail",
  "Miles Notch Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "speckled")

[
  "Mahoosuc Trail",
  "Success Trail",
  "Carla Col Trail",
  "Goose Eye Trail",
  "Notch Trail",
  "Speck Pond Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "mahoosuc")

[
  "Cherry Mtn. Trail",
  "Owl's Head Trail",
  "Martha's Mile",
  "Pondicherry Rail Trail",
  "Little Cherry Pond Loop Trail",
  "Mud Pond Trail"
]
|> RedlineLive.Seed.create_trails(region_ids, "northern_nh")
