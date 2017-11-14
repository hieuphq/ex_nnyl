defmodule EctoAssoc.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :name, :string
    field :email, :string

    has_one :avatar, EctoAssoc.Avatar
    has_many :posts, EctoAssoc.Post

    timestamps()
  end

  @fields ~w(name email)

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    |> validate_required([:name, :email])
    |> put_assoc(:posts, params[:posts])
  end
end