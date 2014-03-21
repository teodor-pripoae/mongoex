Code.require_file "fixtures/user.exs", __DIR__

defmodule MongoexTest do
  use ExUnit.Case

  setup_all do
    Mongoex.Server.setup(address: '127.0.0.1', port: 27017, database: :your_app)
    Mongoex.Server.start
    :ok
  end

  test "the truth" do
    assert true
  end

  test 'creates a new user record' do
    user = User.new(name: "skywalker", age: 25).save
    refute(nil == user._id)
  end

  test 'sets the fields properly' do
    user = User.new(name: "skywalker", age: 25)
    assert(user.name == "skywalker")
    assert(user.age == 25)
  end

end
