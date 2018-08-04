defmodule BaseAuthPhoenix.Repo.Migrations.CreateAuth do
  use Ecto.Migration

  def change do
    create table(:auth) do
      add(:user_id, :string)
      add(:token, :string)
      add(:refresh_token, :string)
      add(:expires_in, :integer)

      timestamps()
    end

    create(unique_index(:auth, [:user_id]))
  end
end
