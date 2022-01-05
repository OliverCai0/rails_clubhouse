class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :name, null: false, default: ""
      t.text :desc
      t.timestamps
    end
  end
end
