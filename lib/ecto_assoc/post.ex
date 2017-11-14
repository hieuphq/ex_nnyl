defmodule EctoAssoc.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "posts" do
    field :header, :string
    field :body, :string

    belongs_to :user, EctoAssoc.User, foreign_key: :user_id, type: :binary_id
    many_to_many :tags, EctoAssoc.Tag, join_through: "posts_tags", on_replace: :delete
  end

  @fields ~w(header body)

  def changeset(data, params \\ %{}) do
    data 
    |> cast(params, @fields)
    |> validate_required([:header, :body])
  end
end

# alias EctoAssoc.{Repo, User, Post}
# user = %User{name: "John Doe", email: "john.doe@example.com"}
# post = Ecto.build_assoc(user, :posts, %{header: "Clickbait header", body: "No real content"})
# Repo.insert!(post)