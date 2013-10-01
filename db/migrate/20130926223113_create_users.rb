class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :age
      t.string :email
      t.string :sex
      t.string :sex_preference
      t.string :tagline
      t.string :photo

      t.timestamps
    end
  end
end
