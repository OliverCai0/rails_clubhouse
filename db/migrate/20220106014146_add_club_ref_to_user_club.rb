class AddClubRefToUserClub < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_clubs, :club, null: false, foreign_key: true
  end
end
