class Procedure < ApplicationRecord

  has_many :patient_procedures

  enum procedure_type: {
    'ultrasound': 'Ultrasound',
    'x_ray': 'X-Ray',
    'procedure': 'Procedure',
  }
end
