require 'spec_helper'

describe User do

  # before :each do
  #   @invalid_user = User.new
  #   @valid_user = User.new(
  #     email: yo@gmail.com
  #   )
  # end

  # it "is valid with an email" do
  #   user = User.new(
  #     email: 'ngjulie020323@gmail.com'
  #   )
  #   expect(user).to be_valid
  # end

  it "is invalid without email" do
    user = User.new
    expect(user).to be_invalid
  end

  it "is a valid email" do
    user = User.new(
        email: "sadfa@h.com"
    )
    expect(user.email).to match /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/
  end

  it "is an invalid email" do
    user = User.new(
        email: "s*^()(&^"
    )
    expect(user.email).not_to match /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/
  end

  it "is invalid with a duplicate email address" do
    User.create(
      email: "hi22@gmail.com"
    )
    user = User.new(
      email: "hi22@gmail.com"
    )
    expect(user).to have(1).errors_on(:email)
  end

  it "is saved with the password match with password confirmation" do
    user = User.new(
      email: 'ngjulie0203@gmail.com',
      password_confirmation: 'ecfhcdjkwehne',
      password: 'ecfe'
    )
    result = user.save
    expect(result).to be_false
  end

  it "is invalid if it can't be authenticated" do
    User.create(
      email: "hi22@gmail.com",
      password: "1234"
    )
    user = User.find_by email: "hi22@gmail.com"
    result = user.authenticate "12345"
    expect(result).to be_false
  end


end

