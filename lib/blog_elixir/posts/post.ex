defmodule BlogElixir.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :context, :string
    field :title, :string
    field :subtitle, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :subtitle, :context])
    |> validate_required([:title, :subtitle, :context])
  end
end
