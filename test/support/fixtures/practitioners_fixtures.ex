defmodule Medicine.PractitionersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Medicine.Practitioners` context.
  """

  @doc """
  Generate a practitioner.
  """
  def practitioner_fixture(attrs \\ %{}) do
    {:ok, practitioner} =
      attrs
      |> Enum.into(%{
        birthdate: "some birthdate",
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        phone: "some phone"
      })
      |> Medicine.Practitioners.create_practitioner()

    practitioner
  end
end
