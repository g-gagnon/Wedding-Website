class CreateRsvp < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvp do |t|
      t.references :user
      t.string :event
      t.string :menu_selection
      t.string :note

      t.timestamps
    end

    add_foreign_key :rsvp, :users
  end
end
