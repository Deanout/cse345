# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tag = Tag.create(:name => "Trade")
tag.save
tag = Tag.create(:name => "Tutors")
tag.save
tag = Tag.create(:name => "Moving")
tag.save
tag = Tag.create(:name => "Roommates")
tag.save
tag = Tag.create(:name => "Other")
tag.save
university = University.create(:name => "Oakland University",
  :city => "Rochester",
  :zip => 48438
)

university.students.build(:student_id => 7056, :university_id => 1).save
50.times do |counter|
  counter = counter + 1
  student = university.students.build(:student_id => counter * 100, :university_id => 1)
  student.save
end

user = User.create(:email => "dean@example.com",
:username => "Dean",
:password => 'password',
:student_id => 7056,
:admin => true)
user.save

25.times do |counter|
  counter = counter + 1
  user = User.create(:email => Forgery('email').address,
  :username => Forgery('name').last_name,
  :password => 'password',
  :student_id => counter * 100)
  user.save
end
25.times do |counter|
  counter = counter + 1
  event = Event.create(
  :title => Forgery(:lorem_ipsum).words(10),
  :body => Forgery(:lorem_ipsum).words(500),
  :event_date => Forgery('date').date,
  :event_time => Time.zone.now,
  :enroll => Forgery('personal').abbreviated_gender == 'F' ? 0 : 1,
  :user_id => counter
  )
  event.save
end

25.times do |counter|
  counter = (counter % 5) + 1
  post = Post.create(
    :title => Forgery(:lorem_ipsum).words(6),
    :body => Forgery(:lorem_ipsum).words(100),
    :exp_time => Time.zone.now,
    :exp_date => 10.days.from_now,
    :user_id => counter,
    :tag_ids => (counter)
  )
  post.save
end
