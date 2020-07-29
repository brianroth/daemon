class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :customer
      t.timestamps
    end

    create_table :items_orders, id: false do |t|
      t.belongs_to :order
      t.belongs_to :item
    end
  end
end
