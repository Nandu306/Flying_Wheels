# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

#Users

John = User.new(name: 'John', address: 'Dam Square, Amsterdam', email: 'john@gmail.com')
John.password = 'qwerty'
John.save

Jake = User.new(name: 'Jake', address: '123 Lane, Amsterdam', email: 'jake@gmail.com')
Jake.password = 'qwerty'
Jake.save

Nancy = User.new(name: 'Nancy', address: '123 Lane, Amsterdam', email: 'nancy@gmail.com')
Nancy.password = 'qwerty'
Nancy.save


#Bikes

Turpentine = Bike.new(type: 'mountain', frame_size: '25D', description: 'Sturdy and well suited to all terrains', rate_per_day: 20)
Turpentine.save







#Bookings






