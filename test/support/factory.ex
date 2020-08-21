defmodule RedlineLive.Factory do
  use ExMachina.Ecto, repo: RedlineLive.Repo

  alias RedlineLive.Map

  def region_factory do
    %Map.Region{
      abbreviation: sequence(:abbreviation, &"region-#{&1}"),
      name: sequence(:name, &"Region #{&1}"),
      position: sequence(:position, & &1)
    }
  end

  def junction_factory do
    %Map.Junction{
      name: sequence(:name, &"junction-#{&1}")
    }
  end

  def trail_factory do
    %Map.Trail{
      name: sequence(:name, &"Trail-#{&1}"),
      region: build(:region)
    }
  end

  def segment_factory do
    %Map.Segment{
      trail: build(:trail),
      start_junction: nil,
      end_junction: nil
    }
  end
end
