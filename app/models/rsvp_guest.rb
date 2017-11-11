class RsvpGuest < ApplicationRecord
  belongs_to :rsvp

  validates_presence_of :name
end
