class Cleaner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  belongs_to :city

  validates :first_name, :last_name, :city, presence: true
  validates :phone_number, presence: {message: I18n.t('customer.mobile_no_validation')},
                     numericality: true,
                     length: { minimum: 10, maximum: 15 }
  validate :validate_phone_number
  
  def email_required?
    false
  end

  

def validate_phone_number
  if Cleaner.where(phone_number: phone_number).exists?
    errors.add(:phone_number, :invalid,message: "  :Your number is aleady register with us")
  end
end
end
