defmodule HelloAbsinthe.Schema do
  use Absinthe.Schema
  import_types HelloAbsinthe.Schema.Types

  @posts [
    %{id: 1, title: "GraphQL Rocks",           votes: 3, author: %{id: 1}},
    %{id: 2, title: "Introduction to GraphQL", votes: 2, author: %{id: 2}},
    %{id: 3, title: "Advanced GraphQL",        votes: 1, author: %{id: 1}}
  ]

  @authors [
    %{id: 1, first_name: "Sashko", last_name: "Stubailo"},
    %{id: 2, first_name: "Tom",    last_name: "Coleman"},
  ]

  query do
    field :posts, list_of(:post) do
      resolve &get_all_posts/2
    end

    field :author, type: :author do
      arg :id, non_null(:id)
      resolve &get_author/2
    end
  end

  # Note that this is just a stubbed out resolver.
  # In a real application, this would be in a different module.
  def get_all_posts(_args, _info) do
    {:ok, @posts}
  end

  def get_author(%{id: id}, _info), do:
    {:ok, find_author(id)}

  def find_author(id) do
    Enum.find(@authors, fn author -> author.id == id end)
  end

  def find_posts(author_id) do
    Enum.find(@posts, fn post -> post.author.id == author_id end)
  end

end
