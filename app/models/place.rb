class Place < ApplicationRecord
    ratyrate_rateable 'overall'

    mount_uploader :picture, PictureUploader

    belongs_to :user
    has_many :comments
    has_many :photos

    # Google maps API
    geocoded_by :address
    after_validation :geocode

    # Core Validations for application
    validates :name, :address, :description, presence: true
    validates :name, length: { in: 3..52 }
    validates :address, length: { in: 9..55 }
    validates :description, length: { in: 20..259 }

    # Scopes available to places controller
    scope :latest, -> { order(created_at: :desc) }
    scope :oldest, -> { order(created_at: :asc) }

end
