class CreateVisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :visitors do |t|
      t.string :ip_address, null: false
      t.string :origin, null: false
      t.bigint :url_id, null: false

      t.timestamps
    end
  end
end
