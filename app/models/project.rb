class Project < ActiveRecord::Base
  validates :order_id, presence: true
  validates :order_id, uniqueness: true
end
