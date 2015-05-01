class User < ActiveRecord::Base
  # attr_accessible :name
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  has_and_belongs_to_many :friends, 
                          class_name: "User", 
                          join_table: :friendships, 
                          foreign_key: :user_id, 
                          association_foreign_key: :friend_user_id
  
  has_and_belongs_to_many :friend_requests,
                          class_name: "User",
                          join_table: :requests,
                          foreign_key: :requested_id, 
                          association_foreign_key: :requestor_id
  
  validates :name, presence: true, length: { maximum: 50 }
  
  def create_friendship(user)
    self.friends << user
    user.friends << self
  end
  
  def request_friend(user)
    user.friend_requests << self
  end
  
  def feed
    all_ids = self.friends.map { |friend| friend.id } + [self.id]
    Post.where(user_id: all_ids).sort_by { |p| p.created_at }.reverse
  end
end
