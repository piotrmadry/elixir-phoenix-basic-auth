defmodule BaseAuthPhoenix.API.ErrorView do
  use BaseAuthPhoenix.Web, :view

  def render("global_error.json", %{status: status}) do
    %{
      code: status,
      message: "Visit our documentation and check required params."
    }
  end

  def render("changeset_error.json", %Ecto.Changeset{} = changeset) do
    %{
      code: 422,
      errors: traverse_errors_in_changesets(changeset)
    }
  end

  defp traverse_errors_in_changesets(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        cond do
          is_list(value) -> String.replace(acc, "%{#{key}}", Enum.join(value))
          true -> String.replace(acc, "%{#{key}}", to_string(value))
        end
      end)
    end)
  end
end
