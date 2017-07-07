class Review < ApplicationRecord
  belongs_to :realm
  belongs_to :user

  validates :body, :presence => true
end
