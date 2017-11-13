defmodule EctoAssoc.Avatar do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "avatars" do
    field :nick_name, :string
    field :pic_url, :string

    belongs_to :user, EctoAssoc.User, foreign_key: :user_id, type: :binary_id

    timestamps()
  end

  @fields ~w(nick_name, pic_url)

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    |> validate_required([:nick_name, :pic_url])
  end
end