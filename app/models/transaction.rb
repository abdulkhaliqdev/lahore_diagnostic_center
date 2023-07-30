class Transaction < ApplicationRecord

  def self.today_income
    today_patient = Patient.where('DATE(created_at) = ?', Date.today)
    today_pay_off = PatientProcedure.where('DATE(created_at) = ?', Date.today)
    
    today_pay_off.map{ |i| i.get_test_price }.sum
  end
end
