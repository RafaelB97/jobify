class Job < ApplicationRecord
    belongs_to :user
    has_many :applications, dependent: :destroy
    enum jobStatus: [:pendiente, :actual, :completado]
end
