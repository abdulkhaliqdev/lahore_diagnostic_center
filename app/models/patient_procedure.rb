class PatientProcedure < ApplicationRecord
  belongs_to :patient
  belongs_to :procedure
  belongs_to :user

  has_rich_text :content
end
