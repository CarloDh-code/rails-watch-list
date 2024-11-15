class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmark

  validates :title, presence: true, uniqueness: true

  validates :overview, presence: true
  
end
