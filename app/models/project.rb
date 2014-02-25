class Project < ActiveRecord::Base
  has_many :roles, dependent: :destroy # or :delete_all if no callbacks on each role
  
  validates :name, presence: true
end
