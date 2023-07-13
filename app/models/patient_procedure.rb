class PatientProcedure < ApplicationRecord
  belongs_to :patient
  belongs_to :procedure
  belongs_to :user

  has_rich_text :content

  scope :uncompleted, -> { where(done: false) }
  scope :completed, -> { where(done: true) }

  def get_test_price
    price.present? ? price : procedure&.price
  end

  def done_status
    done ? 'Completed' : 'Uncompleted'
  end
end
