class Photo < ApplicationRecord
has_many :fans, :through => :likes, :source => :user
has_many :likes
validates :user_id, presence:true
end
