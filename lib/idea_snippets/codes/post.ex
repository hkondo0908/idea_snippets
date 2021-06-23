defmodule IdeaSnippets.Codes.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias IdeaSnippets.Comments.Comment

  schema "posts" do
    field :code, :string
    field :description, :string
    field :title, :string
    field :user_id, :integer

    field :published, Ecto.Enum, values: [:draft, :public, :limited, :private]
    has_many(:comments, Comment)
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :code, :published,:user_id])
    |> validate_required([:title, :description, :code, :published,:user_id])
  end
end
