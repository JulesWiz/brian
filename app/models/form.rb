class Form
  include Mongoid::Document
  include Mongoid::Timestamps

  RELATIONSHIP = ["Family", "Friends"]

  mount_uploader :image, ImageUploader

  field :name, type: String
  field :relationship, type: String
  field :message, type: String
  field :year, type: Integer

  validates :name, :relationship, :message, :year, presence: true

  belongs_to :user

end
