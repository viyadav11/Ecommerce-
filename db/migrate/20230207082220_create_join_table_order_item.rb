class CreateJoinTableOrderItem < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders,:items
  end
end
