defmodule Medicine.Patients.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :birthdate, :string
    field :email, :string

    has_many :prescriptions, Medicine.Prescriptions.Prescription

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:first_name, :last_name, :phone, :birthdate, :email])
    |> validate_required([:first_name, :last_name, :phone, :birthdate, :email])
  end
end
