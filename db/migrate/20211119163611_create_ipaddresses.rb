class CreateIpaddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :ipaddresses do |t|
      t.string :address
      t.boolean :acquired?, default: false, null: false
      t.references :cidrblock
      t.timestamps
    end
  end
end
