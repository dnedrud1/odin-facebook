class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requestor_id
      t.integer :requested_id
      
      t.timestamps
    end
  end
end
