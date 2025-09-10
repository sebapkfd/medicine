defmodule Medicine.Repo.Migrations.AddPatientIdToPrescriptions do
  use Ecto.Migration

  def change do
    alter table(:prescriptions) do
      add :patient_id, references(:patients, on_delete: :nothing)
    end
  end
end
