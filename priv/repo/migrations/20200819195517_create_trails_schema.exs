defmodule RedlineLive.Repo.Migrations.CreateTrailsSchema do
  use Ecto.Migration

  def change do
    create table("regions") do
      add :position, :integer, null: false
      add :abbreviation, :string, null: false
      add :name, :string, null: false

      timestamps type: :utc_datetime_usec
    end

    create table("trails") do
      add :name, :string
      add :region_id, references("regions")

      timestamps type: :utc_datetime_usec
    end

    create table("junctions") do
      add :name, :string
      add :latitude, :decimal
      add :longitude, :decimal

      timestamps type: :utc_datetime_usec
    end

    create table("segments") do
      add :start_junction_id, references("junctions")
      add :end_junction_id, references("junctions")
      add :trail_id, references("trails")

      timestamps type: :utc_datetime_usec
    end
  end
end
