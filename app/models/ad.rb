class Ad < ActiveRecord::Base
	belongs_to :user
	has_many :questions
	
    validates :title, presence: true
    validates :description, presence: true
    validates :date, presence: true
    
end

