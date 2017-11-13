defmodule EctoAssoc.Repo.Migrations.CreateAvatar do
  use Ecto.Migration

  def change do
    create table(:avatars, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :nick_name, :string
      add :pic_url, :string

      timestamps
    end
  end
end
