class Application < ApplicationRecord
  belongs_to :job
  belongs_to :user
  enum status: [:pendiente, :aceptado, :rechazado]
end
