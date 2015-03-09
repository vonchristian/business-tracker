# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(first_name: 'Juan', last_name: 'Cruz', role: :system_administrator, email: 'vc.halip@gmail.com', password: '1111111111', password_confirmation: '1111111111')
