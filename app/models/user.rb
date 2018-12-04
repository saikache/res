class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable


  has_many :transactions

  validates_uniqueness_of :card, :unless => proc{|obj| obj.card.blank? }
  validates :card, :presence => true, :unless => "pin.blank?"
  validates :pin, :presence => true, :if => "!card.blank?"

  def is_admin?
    email == 'admin@admin.com'
  end

  def full_name
    "#{first_name} #{last_name}".titleize
  end

end
