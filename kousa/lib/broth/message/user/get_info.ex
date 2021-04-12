defmodule Broth.Message.User.GetInfo do
  use Broth.Message

  @primary_key false
  embedded_schema do
    # required.
    field(:userId, :binary_id)
  end

  import Ecto.Changeset
  alias Kousa.Utils.UUID

  def changeset(changeset, data) do
    changeset
    |> cast(data, [:userId])
    |> validate_required([:userId])
    |> UUID.normalize(:userId)
  end

  defmodule Reply do
    use Broth.Message

    @primary_key false
    schema "user" do
      embed_error()
    end
  end
end