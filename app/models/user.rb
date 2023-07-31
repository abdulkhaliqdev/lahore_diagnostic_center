class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patient_procedures

  enum role: {
    receptionist: 0,
    admin: 1,
    typist: 2
  }
end
