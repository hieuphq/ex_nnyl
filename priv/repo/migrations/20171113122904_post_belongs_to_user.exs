defmodule EctoAssoc.Repo.Migrations.PostBelongsToUser do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :user_id, references(:users, type: :uuid, null: false)
    end

    create index(:posts, [:user_id])
  end
end
