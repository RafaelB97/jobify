class Job < ApplicationRecord
    belongs_to :user
    has_many :applications
end
