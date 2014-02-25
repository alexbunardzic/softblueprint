class Project < ActiveRecord::Base
  has_many :roles, dependent: :destroy # or :delete_all
  
  validates :name, presence: true
end
