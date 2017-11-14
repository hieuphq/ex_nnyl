defmodule EctoAssoc.Repo.Migrations.CreatePostsTags do
  use Ecto.Migration

  def change do
    create table(:posts_tags, primary_key: false) do
      add :post_id, references(:posts, type: :uuid, on_delete: :nothing), primary_key: true
      add :tag_id, references(:tags, type: :uuid, on_delete: :nothing), primary_key: true
    end

    create unique_index(:posts_tags, [:post_id, :tag_id])
  end
end

# post = Repo.get(Post, "9fcbcb1c-093d-49aa-85a6-cdb7f16dc661")
#       |> Repo.preload(:tags)
#       |> Post.changeset(%{})
#       |> Ecto.Changeset.put_assoc(:tags, []) |> Repo.update()

# post = Repo.get(Post, "9fcbcb1c-093d-49aa-85a6-cdb7f16dc661")
#       |> Repo.preload(:tags)
#       |> Ecto.Changeset.change
#       |> Ecto.Changeset.put_assoc(:tags, []) |> Repo.update()
