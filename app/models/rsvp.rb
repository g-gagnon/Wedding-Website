class Rsvp < ApplicationRecord
  self.table_name= 'rsvp'

  belongs_to :user
  has_many :rsvp_guests, inverse_of: :rsvp, dependent: :destroy
  accepts_nested_attributes_for :rsvp_guests, allow_destroy: true, reject_if: proc { |a| a['name'].blank? }


end
