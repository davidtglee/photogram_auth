class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, :presence => true, :uniqueness => true
  has_many :likes
  has_many :photos
  has_many :comments
  has_many :liked_photos, :through => :likes, :source => :photo
end
