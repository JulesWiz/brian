class Form
  include Mongoid::Document
  include Mongoid::Timestamps

  RELATIONSHIP = ["Family", "Friends"]

  mount_uploader :image, ImageUploader

  field :name
  field :relationship
  field :message
  field :year

  validates :name, :relationship, :message, :year, :image, presence: true

  belongs_to :user

end
