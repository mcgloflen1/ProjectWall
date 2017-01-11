class Idea < ApplicationRecord
	belongs_to :petition
	belongs_to :user
	has_many :replies
	has_many :likes

	validates :ideatext, :presence => true

	scope :newest, -> {
		order("created_at desc")
	}

	scope :oldest, -> {
		order("created_at asc")
	}

  scope :popular, -> {
    order("likes_count desc")
  }
end
