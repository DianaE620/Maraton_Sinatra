class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :decks, through: :rounds

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
