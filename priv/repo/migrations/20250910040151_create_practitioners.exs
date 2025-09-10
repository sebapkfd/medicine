defmodule Medicine.Repo.Migrations.CreatePractitioners do
  use Ecto.Migration

  def change do
    create table(:practitioners) do
      add :first_name, :string
      add :last_name, :string
      add :phone, :string
      add :birthdate, :string
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
