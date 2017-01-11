class Signature < ApplicationRecord
	belongs_to :petition, :counter_cache => true
	belongs_to :user

	validates :user_id, :uniqueness => {scope: :petition}

	scope :newest, -> {
		order("created_at desc")
	}
end
