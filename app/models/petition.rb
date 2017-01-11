class Petition < ApplicationRecord
	belongs_to :college
	belongs_to :user
	has_many :ideas
	has_many :alliances
	has_many :signatures

	validates :goal, :numericality => { :greater_than_or_equal_to => 0 }
	validates :headline, :description, :recipient, :recipient_email, :presence => true 

	acts_as_taggable

	scope :newest, -> {
		order("created_at desc")
	}

	scope :oldest, -> {
		order("created_at asc")
	}

  scope :popular, -> {
    order("signatures_count desc")
  }

  scope :trending, -> {
    order("signatures_count desc").where('created_at >= ?', 4.week.ago)
  }
end