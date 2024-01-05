defmodule BlogElixir.Repo.Migrations.CreatePosts do
  @moduledoc """
  used to make changes to a database schema
  """
  use Ecto.Migration #  provides functions for manipulating tables and fields in a table.

  def change do
    create table(:posts) do #create macro creates new table
      add :title, :string # add macro adds a row to a table
      add :subtitle, :string
      add :content, :text

      timestamps(type: :utc_datetime)
    end
  end
end
