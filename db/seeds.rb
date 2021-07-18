# This file should contain all the record creation needed to seed the database with its default
# values. The data can then be loaded with the rails db:seed command (or created alongside the
# database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }]) Character.create
#   (name: 'Luke', movie: movies.first)

# require 'date'

Booking.destroy_all
Bike.destroy_all
User.destroy_all


#Users

John = User.find_or_initialize_by(name: 'John', address: 'Dam Square, Amsterdam', email: 'john@gmail.com')
John.password = 'qwerty'
John.save

Jake = User.find_or_initialize_by(name: 'Jake', address: '123 Lane, Amsterdam', email: 'jake@gmail.com')
Jake.password = 'qwerty'
Jake.save

Nancy = User.find_or_initialize_by(name: 'Nancy', address: '123 Lane, Amsterdam', email: 'nancy@gmail.com')
Nancy.password = 'qwerty'
Nancy.save

Peter = User.find_or_initialize_by(name: 'Peter', address: '124 Lane, Amsterdam', email: 'peter@gmail.com')
Peter.password = 'qwerty'
Peter.save

Alice = User.find_or_initialize_by(name: 'Alice', address: '125 Lane, Amsterdam', email: 'alice@gmail.com')
Alice.password = 'qwerty'
Alice.save


#Bikes

Turpentine = Bike.find_or_initialize_by(bike_category: 'mountain', frame_size: '25D', description: 'Sturdy and well suited to
all terrains', rate_per_day: 20, user: Jake)
Turpentine.save

London = Bike.find_or_initialize_by(bike_category: 'city', frame_size: '30D', description: 'Sturdy and well suited to cities',
rate_per_day: 15, user: John)
London.save

Kids = Bike.find_or_initialize_by(bike_category: 'kids', frame_size: '18D', description: 'Sturdy and well suited to children',
rate_per_day: 15, user: Nancy )
Kids.save


#Bookings

Booking1 = Booking.find_or_initialize_by(start_date: Date.new(2021,2,1), end_date: Date.new(2021,2,10), status: 'accepted', user:
Nancy, bike: London)
Booking1.save

Booking2 = Booking.find_or_initialize_by(start_date: Date.new(2021,3,7), end_date: Date.new(2021,3,15), status: 'accepted', user:
Alice, bike: Kids)
Booking2.save

Booking3 = Booking.find_or_initialize_by(start_date: Date.new(2021,3,1), end_date: Date.new(2021,3,10), status: 'accepted', user:
Peter, bike: Turpentine)
Booking3.save






