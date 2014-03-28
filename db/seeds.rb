# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

temp_password = "123"

User.create ([
  { email: "ngjulie0203@gmail.com",
    admin: true,
    password: temp_password,
    password_confirmation: temp_password
   },
  { email: "j_stagie2002@hotmail.com",
    password: temp_password,
    password_confirmation: temp_password
  }
])
