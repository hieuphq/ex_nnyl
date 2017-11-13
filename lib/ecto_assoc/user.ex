defmodule EctoAssoc.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :name, :string
    field :email, :string

    has_one :avatar, EctoAssoc.Avatar

    timestamps()
  end

  @fields ~w(name email)

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    |> validate_required([:name, :email])
  end
end