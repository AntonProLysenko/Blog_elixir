defmodule BlogElixir.Posts.Post do
  #Post Schema
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :title, :string
    field :subtitle, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :subtitle, :content])
    |> validate_required([:title, :subtitle, :content])#REQURED FIELDS IN A STRUCT
    |> unique_constraint(:title) #Defining that title value must be unique
  end
end
