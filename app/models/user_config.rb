class UserConfig < ApplicationRecord
  belongs_to :user

  enum invitation_type: [:undeclared, :solo, :couple, :family]
end
