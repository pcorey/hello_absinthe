defmodule HelloAbsinthe.Schema.Types do
  use Absinthe.Schema.Notation

  object :author do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :posts, list_of(:post)
  end

  object :post do
    field :id, :id
    field :title, :string
    field :author, :author
    field :votes, :integer
  end

end
