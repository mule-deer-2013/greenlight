class AddMessageTable < ActiveRecord::Migration
  def change 
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :reciever_id 
      t.text    :content

      t.timestamps
    end
  end
end
