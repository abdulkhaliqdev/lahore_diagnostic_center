class Transaction < ApplicationRecord

  def self.today_income
    today_patient = Patient.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    today_pay_off = PatientProcedure.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    
    today_pay_off.map{ |i| i.get_test_price }.sum
  end
end
