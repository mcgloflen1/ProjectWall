class Alliance < ApplicationRecord
	belongs_to :user
	belongs_to :petition

	validates :user_id, :uniqueness => {scope: :petition}

	scope :newest, -> {
		order("created_at desc")
	}
end
