defmodule BaseAuthPhoenix.Authroization do
  @moduledoc """
  The Authroization context.
  """

  import Ecto.Query, warn: false
  alias BaseAuthPhoenix.Repo

  alias BaseAuthPhoenix.Authroization.AuthTokens

  @doc """
  Returns the list of auth.

  ## Examples

      iex> list_auth()
      [%AuthTokens{}, ...]

  """
  def list_auth do
    Repo.all(AuthTokens)
  end

  @doc """
  Gets a single auth_tokens.

  Raises `Ecto.NoResultsError` if the Auth tokens does not exist.

  ## Examples

      iex> get_auth_tokens!(123)
      %AuthTokens{}

      iex> get_auth_tokens!(456)
      ** (Ecto.NoResultsError)

  """
  def get_auth_tokens!(id), do: Repo.get!(AuthTokens, id)

  @doc """
  Creates a auth_tokens.

  ## Examples

      iex> create_auth_tokens(%{field: value})
      {:ok, %AuthTokens{}}

      iex> create_auth_tokens(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_auth_tokens(attrs \\ %{}) do
    %AuthTokens{}
    |> AuthTokens.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a auth_tokens.

  ## Examples

      iex> update_auth_tokens(auth_tokens, %{field: new_value})
      {:ok, %AuthTokens{}}

      iex> update_auth_tokens(auth_tokens, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_auth_tokens(%AuthTokens{} = auth_tokens, attrs) do
    auth_tokens
    |> AuthTokens.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AuthTokens.

  ## Examples

      iex> delete_auth_tokens(auth_tokens)
      {:ok, %AuthTokens{}}

      iex> delete_auth_tokens(auth_tokens)
      {:error, %Ecto.Changeset{}}

  """
  def delete_auth_tokens(%AuthTokens{} = auth_tokens) do
    Repo.delete(auth_tokens)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking auth_tokens changes.

  ## Examples

      iex> change_auth_tokens(auth_tokens)
      %Ecto.Changeset{source: %AuthTokens{}}

  """
  def change_auth_tokens(%AuthTokens{} = auth_tokens) do
    AuthTokens.changeset(auth_tokens, %{})
  end
end
