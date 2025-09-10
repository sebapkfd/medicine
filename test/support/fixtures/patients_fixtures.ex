defmodule Medicine.PatientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medicine.Patients` context.
  """

  @doc """
  Generate a patient.
  """
  def patient_fixture(attrs \\ %{}) do
    {:ok, patient} =
      attrs
      |> Enum.into(%{
        birthdate: "some birthdate",
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        phone: "some phone"
      })
      |> Medicine.Patients.create_patient()

    patient
  end
end
