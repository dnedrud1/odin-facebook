class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :post
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    
    validates :content, presence: true, length: { maximum: 500 }
    validates :user_id, presence: true
end
