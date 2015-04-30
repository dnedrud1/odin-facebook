class Friendship < ActiveRecord::Base
  validates :user_id, presence: true
  validates :friend_user_id, presence: true
end
