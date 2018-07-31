defmodule BaseAuthPhoenix.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:name, :string)
      add(:last_name, :string)
      add(:crypted_password, :string)
      add(:email, :string)
      timestamps()
    end

    create(unique_index(:users, [:email]))
  end
end
