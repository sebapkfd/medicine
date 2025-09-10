defmodule Medicine.Repo.Migrations.AddPractitionerIdToPrescriptions do
  use Ecto.Migration

  def change do
    alter table(:prescriptions) do
      add :practitioner_id, references(:practitioners, on_delete: :nothing)
    end
  end
end
