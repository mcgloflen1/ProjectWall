class College < ApplicationRecord
	has_many :petitions

	validates :name, :city, :state, :country, :presence => true

	scope :alphabetically, -> {
		order("name asc")
	}

	scope :approved, -> {
		where(:college_approval => true)
	}

	scope :pending, -> {
		where(:college_approval => false)
	}

	scope :newest, -> {
		order("created_at desc")
	}

	scope :oldest, -> {
		order("created_at asc")
	}


end
