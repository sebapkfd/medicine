defmodule Medicine.Prescriptions.Prescription do
  use Ecto.Schema
  import Ecto.Changeset

  schema "prescriptions" do
    field :detail, :string

    belongs_to :patient, Medicine.Patients.Patient

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(prescription, attrs) do
    prescription
    |> cast(attrs, [:detail])
    |> validate_required([:detail])
  end
end
