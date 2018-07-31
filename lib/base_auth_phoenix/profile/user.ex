defmodule BaseAuthPhoenix.Profile.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "users" do
    field(:email, :string, null: false)
    field(:password, :string, virtual: true)
    field(:crypted_password, :string, null: false)
    field(:name, :string)
    field(:last_name, :string)
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:id, :email, :password, :name, :last_name])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> put_crypted_password()
  end

  defp put_crypted_password(%Ecto.Changeset{changes: %{password: password}} = changeset) do
    change(changeset, crypted_password: Bcrypt.hash_pwd_salt(password))
  end

  defp put_crypted_password(changeset) do
    changeset
  end
end
