class Review < ApplicationRecord
  belongs_to :realm

  validates :body, :presence => true
  validates :author, :presence => true
end
