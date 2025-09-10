defmodule MedicineWeb.Admin.PrescriptionJSON do
  alias Medicine.Prescriptions.Prescription

  @doc """
  Renders a list of prescriptions.
  """
  def index(%{prescriptions: prescriptions}) do
    %{data: for(prescription <- prescriptions, do: data(prescription))}
  end

  @doc """
  Renders a single prescription.
  """
  def show(%{prescription: prescription}) do
    %{data: data(prescription)}
  end

  defp data(%Prescription{} = prescription) do
    %{
      id: prescription.id,
      detail: prescription.detail
    }
  end
end
