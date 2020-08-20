defmodule RedlineLive.Map.Region do
  use Ecto.Schema
  import Ecto.Changeset

  alias RedlineLive.Map

  schema "regions" do
    field(:abbreviation, :string)
    field(:name, :string)
    field(:position, :integer)

    has_many(:trails, Map.Trail)
    timestamps(type: :utc_datetime_usec)
  end

  def changeset(region, attrs) do
    required_attrs = [:abbreviation, :name, :position]

    region
    |> cast(attrs, required_attrs)
    |> validate_required(required_attrs)
  end
end
