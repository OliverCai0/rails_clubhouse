class AddClubRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :club, null: false, foreign_key: true
  end
end
