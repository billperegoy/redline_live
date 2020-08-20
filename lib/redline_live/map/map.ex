defmodule RedlineLive.Map do
  import Ecto.Query, warn: false

  alias RedlineLive.{Map, Repo}

  def create_region(attrs) do
    %Map.Region{}
    |> Map.Region.changeset(attrs)
    |> Repo.insert()
  end

  def list_regions() do
    from(region in Map.Region, order_by: region.position, preload: :trails)
    |> Repo.all()
  end

  def create_trail(attrs) do
    %Map.Trail{}
    |> Map.Trail.changeset(attrs)
    |> Repo.insert()
  end
end
