class Job < ApplicationRecord
    # Associations
    belongs_to :user
    has_many :applications, dependent: :destroy

    # Enum
    enum jobStatus: [:pendiente, :actual, :completado]

    #Validations
    validate :initDate_cannot_be_in_past, :endDate_cannot_be_less

    # A constrains that not allow put incorrect init date
    def initDate_cannot_be_in_past
        if initDate < Date.today
            errors.add(:initDateError, "No puede ser en pasado")
        end
    end

    # A constrains that not allow put incorrect end date
    def endDate_cannot_be_less 
        if endDate < initDate
            errors.add(:endDateError, "No puede ser menor que el dia de incio")
        end
    end

end
