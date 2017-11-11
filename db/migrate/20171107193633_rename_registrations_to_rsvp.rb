class RenameRegistrationsToRsvp < ActiveRecord::Migration[5.0]
  def change
    rename_table :rsvp, :rsvp
    rename_table :registration_infos, :rsvp_guests
    rename_column :rsvp_guests, :registration_id, :rsvp_id
    rename_index :rsvp_guests, :index_rsvp_guests_on_registration_id, :index_rsvp_guests_on_rsvp_id
  end
end
