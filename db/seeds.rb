# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Subscription.destroy_all

customer = Customer.create!(first_name: 'Ted', last_name: 'Staros', email: 'tstaros23@gmail.com', address: '11 Revere Dr.')
subscription = Subscription.create!(customer_id: customer.id, title: 'Tea Monthly', price: 52, status: 'Active', frequency: 'Monthly' )
subscription2 = Subscription.create!(customer_id: customer.id, title: 'Tea weekly', price: 46, status: 'Active', frequency: 'Weekly' )
subscription3 = Subscription.create!(customer_id: customer.id, title: 'Tea Monthly', price: 54, status: 'Cancelled', frequency: 'Monthly' )
