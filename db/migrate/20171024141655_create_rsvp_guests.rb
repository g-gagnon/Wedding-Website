class CreateRsvpGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvp_guests do |t|
      t.references :rsvp, index: true
      t.string :name
      t.string :email
      t.string :meal_selection
      t.string :note
      t.timestamps
    end

    add_foreign_key :rsvp_guests, :rsvp
  end
end
