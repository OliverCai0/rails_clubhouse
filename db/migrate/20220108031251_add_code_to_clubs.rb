class AddCodeToClubs < ActiveRecord::Migration[7.0]
  def change
    add_column :clubs, :code, :string
  end
end
