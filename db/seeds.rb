# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |counter|
  user = User.create(:email => Forgery('email').address,
  :username => Forgery('name').last_name,
  :password => 'password')
  user.save
end
50.times do |counter|
  counter = counter + 1
  event = Event.create(
  :title => Forgery(:lorem_ipsum).words(10),
  :body => Forgery(:lorem_ipsum).words(500),
  :event_date => Forgery('date').date,
  :event_time => Time.zone.now,
  :enroll => Forgery('personal').abbreviated_gender == 'F' ? 0 : 1,
  :user_id => User.find(counter).id
  )
  event.save
end
