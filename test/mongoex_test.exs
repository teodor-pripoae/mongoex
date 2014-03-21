Code.require_file "fixtures/user.exs", __DIR__

defmodule MongoexTest do
  use ExUnit.Case

  setup_all do
    host = to_char_list(System.get_env("WERCKER_MONGODB_HOST") || "127.0.0.1")
    port = binary_to_integer(System.get_env("WERCKER_MONGODB_PORT") || "27017")
    Mongoex.Server.setup(address: host, port: port, database: :mongoex)
    Mongoex.Server.start
    :ok
  end

  test 'creates a new user record' do
    user = User.new(name: "skywalker", age: 25).save
    refute(nil == user._id)
    assert(user.name == "skywalker")
    assert(user.age == 25)
  end

  test 'sets the fields properly' do
    user = User.new(name: "skywalker", age: 25)
    assert(user.name == "skywalker")
    assert(user.age == 25)
  end

end
