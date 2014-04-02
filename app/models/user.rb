require 'bcrypt'

PASSWORD_RESET_EXPIRES = 4

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :image, ImageUploader

  attr_accessor :password, :password_confirmation

  field :email
  field :salt
  field :fish
  field :reset_code
  field :reset_expires_at, type: Time
  field :admin, type: Boolean, default: false

  has_many :forms, validate: false, dependent: :delete, autosave: true

  before_create :set_random_password, unless: :password
  before_save :encrypt_password, if: :password
  before_save :downcase_attributes
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true

  def self.authenticate(email, password)
    user = User.find_by email: email
    user if user and user.authenticate(password)
  end

  def self.find_by_code(code)
    if user = User.find_by({:reset_code => code, :reset_expires_at => {"$gte" => Time.now.gmtime}})
      user.set_expiration
    end
    user
  end

  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  def update_info(params)
    self.update_attributes(params)
  end

  def set_reset_code
    self.reset_code = SecureRandom.urlsafe_base64
    set_expiration
  end

  def reset_password(params)
    if self.update_attributes(params)
      self.update_attributes(params.merge( reset_code: nil, reset_expires_at: nil ))
    end
  end

  def set_expiration
    self.reset_expires_at = PASSWORD_RESET_EXPIRES.hours.from_now
    self.save!
  end

  protected

    def downcase_attributes
      self.email.downcase!
    end

    def set_salt
      self.salt = BCrypt::Engine.generate_salt
    end

    def set_random_password
      if self.fish.blank?
        self.fish = BCrypt::Engine.hash_secret(SecureRandom.base64(32), set.salt)
      end
    end

    def encrypt_password
      self.fish = BCrypt::Engine.hash_secret(password, set.salt)
      true
    end

end

