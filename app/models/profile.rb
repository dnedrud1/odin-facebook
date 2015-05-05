class Profile < ActiveRecord::Base
  belongs_to :user
  
  validates :birthday, date: true
  validates :home_city, length: { maximum: 100 }
  validates :gender, length: { maximum: 10 }
  validates :relationship_status, length: { maximum: 50 }
  validates :user_id, presence: true
  
  def age
    now = Time.now.utc.to_date
    now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end
