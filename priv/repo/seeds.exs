# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Razoyo.Repo.insert!(%Razoyo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Razoyo.User

User.create_account(%{secret_key: "qRIAKP5ywR5i6sGcv3dFbYDEKoUmV5V5"})
