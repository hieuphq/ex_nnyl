defmodule EctoAssoc.Tag do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "tags" do
    field :name, :string

    many_to_many :posts, EctoAssoc.Post, join_through: "posts_tags", on_replace: :delete
  end
end

# alias EctoAssoc.{Repo, Post, Tag}
# post = %Post{header: "Clickbait header", body: "No real content", tags: [%Tag{name: "a"}, %Tag{name: "b"}]}
# post = Repo.insert!(post)
