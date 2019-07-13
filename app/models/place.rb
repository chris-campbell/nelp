class Place < ApplicationRecord

    mount_uploader :picture, PictureUploader

    belongs_to :user
    has_many :comments
    has_many :photos
    has_one :tally

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

    def tally_up
      new_tally = tally.tally_yes += 1
      new_score = tally.score += 1
      percentage = (new_tally.to_f / new_score * 100).to_i
      tally.update_attributes(tally_yes: new_tally, score: new_score, percent: percentage)
    end

    def tally_down
      new_tally = tally.tally_no += 1
      new_score = tally.score += 1
      percentage = (tally.tally_yes.to_f / new_score * 100).to_i
      tally.update_attributes(tally_no: new_tally, score: new_score, percent: percentage)
    end



end
