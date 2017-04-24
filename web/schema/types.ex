defmodule HelloAbsinthe.Schema.Types do
  use Absinthe.Schema.Notation

  object :author do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :posts, list_of(:post) do
      resolve fn author, _, _ ->
        {:ok, HelloAbsinthe.Schema.find_posts(author.id)}
      end
    end
  end

  object :post do
    field :id, :id
    field :title, :string
    field :author, :author do
      resolve fn post, _, _ ->
        {:ok, HelloAbsinthe.Schema.find_author(post.author.id)}
      end
    end
    field :votes, :integer
  end

end
