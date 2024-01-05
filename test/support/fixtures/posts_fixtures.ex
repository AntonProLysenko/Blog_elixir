defmodule BlogElixir.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BlogElixir.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        context: "some context",
        subtitle: "some subtitle",
        title: "some title"
      })
      |> BlogElixir.Posts.create_post()

    post
  end
end
