defmodule Article do
  use Mongoex.Base, table_name: :blog_entries
  fields title: :something
end