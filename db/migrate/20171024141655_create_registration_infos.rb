class CreateRegistrationInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :registration_infos do |t|
      t.references :registration, index: true
      t.string :name
      t.string :email
      t.string :meal_selection
      t.string :note
      t.timestamps
    end

    add_foreign_key :registration_infos, :rsvp
  end
end
