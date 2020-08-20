defmodule RedlineLive.Map.Trail do
  use Ecto.Schema
  import Ecto.Changeset

  alias RedlineLive.Map

  schema "trails" do
    field(:name, :string, null: false)
    belongs_to(:region, Map.Region)

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(trail, attrs) do
    required_attrs = [:name, :region_id]

    trail
    |> cast(attrs, required_attrs)
    |> validate_required(required_attrs)
  end
end
