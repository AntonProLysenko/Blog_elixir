defmodule BlogElixir.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :subtitle, :string
      add :context, :text

      timestamps(type: :utc_datetime)
    end
  end
end
