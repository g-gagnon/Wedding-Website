class AddInfoToRegistrations < ActiveRecord::Migration[5.0]
  def change
    change_table :rsvp do |t|
      t.string :menu_selection
      t.string :note
    end
  end
end
