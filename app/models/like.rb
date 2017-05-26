class Like < ApplicationRecord
belongs_to :user
validates :photo_id,:user_id, presence:true
validates :user_id, uniqueness:true
end
