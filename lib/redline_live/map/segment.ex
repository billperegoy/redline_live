defmodule RedlineLive.Map.Segment do
  use Ecto.Schema
  import Ecto.Changeset

  alias RedlineLive.Map

  schema "segments" do
    belongs_to(:trail, Map.Trail)
    belongs_to(:start_junction, Map.Junction)
    belongs_to(:end_junction, Map.Junction)

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(segment, attrs) do
    required_attrs = [:trail_id]
    optional_attrs = [:start_junction_id, :end_junction_id]

    segment
    |> cast(attrs, required_attrs ++ optional_attrs)
    |> validate_required(required_attrs)
  end
end
