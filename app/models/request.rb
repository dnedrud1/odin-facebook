class Request < ActiveRecord::Base
  validates :requestor_id, presence: true
  validates :requested_id, presence: true
end
