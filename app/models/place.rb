class Place < ApplicationRecord
    ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'
    
    belongs_to :user
    has_many :comments
    has_many :photos
    
    # Google maps API
    geocoded_by :address
    after_validation :geocode
    
    # Core Validations for application
    validates :name, :address, :description, presence: true
    validates :name, :address, :description, length: { minimum: 3 }
    
    scope :latest, -> { order(created_at: :desc) }
    scope :oldest, -> { order(created_at: :asc) }
    
    
    def format_date(date)
        formatted = date.strftime('%b %e, %l:%M %p')
        return formatted
    end
    
end
