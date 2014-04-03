class Name
  include Mongoid::Document

  embedded_in :form

  field :prefix
  field :name
  field :middle
  field :family
  field :suffix

  validates :name, :family, presence: true

  def full
    [
      self.prefix,
      self.name,
      self.middle,
      self.family,
      self.suffix,
    ].compact.join(" ")
  end

  def full_reversed
    [
      self.family,
      [
        self.prefix,
        self.name,
        self.middle,
      ].compact.join(" "),
      self.suffix
    ].compact.join(", ")
  end

  def simple
    [ self.name, self.middle, self.family ].compact.join(" ")
  end

  def simple_reversed
    [
      self.family,
      [ self.name, self.middle ].compact.join(" ")
    ].compact.join(", ")
  end

  def reversed
    [ self.family, self.name ].compact.join(" ")
  end
end