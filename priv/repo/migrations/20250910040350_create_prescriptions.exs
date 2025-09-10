defmodule Medicine.Repo.Migrations.CreatePrescriptions do
  use Ecto.Migration

  def change do
    create table(:prescriptions) do
      add :detail, :text

      timestamps(type: :utc_datetime)
    end
  end
end
