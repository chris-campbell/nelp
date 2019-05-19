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
    
    
    
    def count(l)
        
        1.upto(l) do |n|
            p n
        end
         
    end
    
end
