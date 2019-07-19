class Tally < ApplicationRecord
  belongs_to :place
  has_many :votes, dependent: :destroy
end
