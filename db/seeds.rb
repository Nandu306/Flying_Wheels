# This file should contain all the record creation needed to seed the database with its default
# values. The data can then be loaded with the rails db:seed command (or created alongside the
# database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }]) Character.create
#   (name: 'Luke', movie: movies.first)

# require 'date'
# require 'open-uri'

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

# file = URI.open('https://cdn.shopify.com/s/files/1/0777/4197/files/1200x750-Page-Image-Custom-Builds.jpg?v=1479913058')

Turpentine = Bike.find_or_initialize_by(bike_category: 'Mountain', frame_size: '25D', description: 'Sturdy and well suited to
all terrains', address: 'Oosterpark, Amsterdam', rate_per_day: 20, user: Jake)

Turpentine.photo.attach(io: File.open('app/assets/images/mountain_bike.jpeg'), filename: 'mountain_bike.jpeg')
Turpentine.save


London = Bike.find_or_initialize_by(bike_category: 'City', frame_size: '30D', description: 'Sturdy and well suited to cities',
address: 'Dam Square, Amsterdam', rate_per_day: 15, user: John)

London.photo.attach(io: File.open('app/assets/images/city.jpg'), filename: 'city.jpg')

London.save

Kids = Bike.find_or_initialize_by(bike_category: "Children", frame_size: '18D', description: 'Sturdy and well suited to children',
address: 'Rokin, Amsterdam', rate_per_day: 15, user: Nancy )

Kids.photo.attach(io: File.open('app/assets/images/Kids bike_3.jpg'), filename: 'Kids bike_3.jpg')

Kids.save

Mighty = Bike.find_or_initialize_by(bike_category: 'Mountain', frame_size: '30D', description: 'Sturdy and well suited to
all terrains', address: 'Oosterpark, Amsterdam', rate_per_day: 20, user: Alice)

Mighty.photo.attach(io: File.open('app/assets/images/mountain_bike.jpeg'), filename: 'mountain_bike.jpeg')
Mighty.save

Paris = Bike.find_or_initialize_by(bike_category: 'City', frame_size: '20F', description: 'Sturdy and well suited to cities',
address: 'Dam Square, Amsterdam', rate_per_day: 15, user: Peter)

Paris.photo.attach(io: File.open('app/assets/images/city.jpg'), filename: 'city.jpg')

Paris.save

Rough = Bike.find_or_initialize_by(bike_category: 'Mountain', frame_size: '28D', description: 'Sturdy and well suited to
all terrains', address: 'Oosterpark, Amsterdam', rate_per_day: 20, user: Nancy)

Rough.photo.attach(io: File.open('app/assets/images/mountain_bike.jpeg'), filename: 'mountain_bike.jpeg')
Rough.save

#Bookings

Booking1 = Booking.find_or_initialize_by(start_date: Date.new(2021,2,1), end_date: Date.new(2021,2,10), status: 'Accepted', user:
Nancy, bike: London)
Booking1.save
# p Booking1.errors.full_messages

Booking2 = Booking.find_or_initialize_by(start_date: Date.new(2021,3,7), end_date: Date.new(2021,3,15), status: 'Accepted', user:
Alice, bike: Kids)
Booking2.save

Booking3 = Booking.find_or_initialize_by(start_date: Date.new(2021,3,1), end_date: Date.new(2021,3,10), status: 'Accepted', user:
Peter, bike: Turpentine)
Booking3.save

# Booking4 = Booking.find_or_initialize_by(start_date: Date.new(2021,3,1), end_date: Date.new(2021,3,10), status: 'accepted', user: Jake, bike: Turpentine)
# Booking4.save
# p Booking4.errors.full_messages






