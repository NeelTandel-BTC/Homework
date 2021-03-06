class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :city
  has_many :bookings

  validates :first_name, :last_name, :presence => true
  validates :phone_number,   presence: {message: I18n.t('customer.mobile_no_validation')},
                     numericality: true,
                     length: { minimum: 10, maximum: 15 }
         
  def email_required?
    false
  end

  def can_validate
    true
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
