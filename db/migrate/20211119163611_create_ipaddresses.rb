class CreateIpaddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :ipaddresses do |t|
      t.string :address
      t.boolean :available?, default: true, null: false
      t.references :cidr_block
      t.timestamps
    end
  end
end
