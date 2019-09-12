class Bizlist < ApplicationRecord
  belongs_to :user
  has_many :businesses

  validates :name, presence: true
end
