defmodule EctoAssoc.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :header, :string
      add :body, :string
    end
  end
end
