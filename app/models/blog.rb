class Blog < ApplicationRecord
    validates :title, :content, presence: true, length: { maximum: 140 }
    validates :recruitment_number, numericality:{only_integer:true, greater_than_or_equal_to:0}
    validates_datetime :starting_time, :finishing_time
    
    belongs_to :user
    belongs_to :applicant, optional: true
    has_many :favorites, dependent: :destroy
    has_many :favorite_applicants, through: :favorites, source: :applicant
    
end
