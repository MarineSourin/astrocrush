class User < ApplicationRecord
  attr_reader :my_zodiac

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_confirmation_of :password

  has_many_attached :photos
  accepts_nested_attributes_for :photos

  has_many :matches, dependent: :destroy
  has_many :messages, dependent: :destroy
  # has_many :chatrooms, ->(user) {
  #   unscope(where: :user_id)
  #     .where("first_user_id = :user_id OR second_user_id = :user_id", user_id: user.id)
  # },
    # class_name: 'Chatroom', dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true
  # validates :email, presence: true, /.+@.+\.\w{2,3}/
  # validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a- z]{2,})$/i
  validates :birth_date, presence: true
  # validates_date :date_of_birth, :after => Proc.new { Date.today }
  validates :birth_hour, presence: true
  validates :birth_location, presence: true
  validates :birth_country, presence: true
  validates :gender, presence: true
  # validates :looking_for, presence: true
  # validate :user_is_adult
  validates_length_of :description, maximum: 500
    # private

    # def user_is_adult
    #   if Date.today.year - birth_date.year < 18
    #     self.errors.add(:birth_date, "User must be over 18 years old")
    #   end
    # end

  def matches
    Match.where(user: self).or(Match.where(mate: self))
  end
end
