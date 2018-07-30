defmodule BaseAuthPhoenix.Repo.Migrations.CreateAuth do
  use Ecto.Migration

  def change do
    create table(:auth) do
      add :name, :string
      add :age, :integer

      timestamps()
    end

  end
end
