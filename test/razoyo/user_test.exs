defmodule Razoyo.UserTest do
  use Razoyo.DataCase

  alias Razoyo.User

  describe "users" do
    alias Razoyo.User.Account

    import Razoyo.UserFixtures

    @invalid_attrs %{}

    test "list_users/0 returns all users" do
      account = account_fixture()
      assert User.list_users() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert User.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      valid_attrs = %{}

      assert {:ok, %Account{} = account} = User.create_account(valid_attrs)
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      update_attrs = %{}

      assert {:ok, %Account{} = account} = User.update_account(account, update_attrs)
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_account(account, @invalid_attrs)
      assert account == User.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = User.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> User.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = User.change_account(account)
    end
  end
end
