class Cleaner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings

  validates :first_name, :last_name, :city, presence: true
  validates :phone_number, presence: {message: I18n.t('customer.mobile_no_validation')},
                     numericality: true,
                     length: { minimum: 10, maximum: 15 }

  belongs_to :city
  
  def email_required?
    false
  end
  
end
