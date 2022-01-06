class CreateUserClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :user_clubs do |t|
      
      t.timestamps
    end
  end
end
