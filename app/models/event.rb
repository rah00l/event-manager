class Event < ApplicationRecord
	# Associations
	has_many :event_users
	has_many :users, through: :event_users, dependent: :destroy

	accepts_nested_attributes_for :users
end
