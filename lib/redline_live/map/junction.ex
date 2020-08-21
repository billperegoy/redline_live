defmodule RedlineLive.Map.Junction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "junctions" do
    field(:name, :string)
    field(:latitude, :decimal)
    field(:longitude, :decimal)

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(junction, attrs) do
    optional_attrs = [:name, :latitude, :longitude]

    cast(junction, attrs, optional_attrs)
  end
end
