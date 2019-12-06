class Application < ApplicationRecord
  # Associations
  belongs_to :job
  belongs_to :user

  # Enum
  enum status: [:pendiente, :aceptado, :rechazado]
end
