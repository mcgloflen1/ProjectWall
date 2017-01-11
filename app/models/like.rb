class Like < ApplicationRecord
	belongs_to :idea, :counter_cache => true
	belongs_to :user

	validates :user_id, :uniqueness => {scope: :idea}
end
