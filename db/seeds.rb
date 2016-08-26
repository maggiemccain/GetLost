# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.name = "Sam"
u.gender = "male"
u.email = "sam@ga.co"
u.password = "pudding"
u.save

u1 = User.new
u1.name = "Maggie"
u1.gender = "female"
u1.email = "maggia@ga.co"
u1.password = "pudding"
u1.save

u2 = User.new
u2.name = "Ray"
u2.gender = "male"
u2.email = "ray@ga.co"
u2.password = "pudding"
u2.save

u3 = User.new
u3.name = "Jordan"
u3.gender = "male"
u3.email = "jordan@ga.co"
u3.password = "pudding"
u3.save

u4 = User.new
u4.name = "Tad"
u4.gender = "male"
u4.email = "tad@ga.co"
u4.password = "pudding"
u4.save

u5 = User.new
u5.name = "Andrew"
u5.gender = "male"
u5.email = "andrew@ga.co"
u5.password = "pudding"
u5.save

u6 = User.new
u6.name = "Denis"
u6.gender = "male"
u6.email = "denis@ga.co"
u6.password = "pudding"
u6.save

u7 = User.new
u7.name = "Dean"
u7.gender = "male"
u7.email = "dean@ga.co"
u7.password = "pudding"
u7.save

u8 = User.new
u8.name = "Magda"
u8.gender = "female"
u8.email = "magda@ga.co"
u8.password = "pudding"
u8.save

u9 = User.new
u9.name = "Anthony"
u9.gender = "male"
u9.email = "anthony@ga.co"
u9.password = "pudding"
u9.save

u10 = User.new
u10.name = "Harry"
u10.gender = "male"
u10.email = "harry@ga.co"
u10.password = "pudding"
u10.save

u11 = User.new
u11.name = "DT"
u11.gender = "male"
u11.email = "dt@ga.co"
u11.password = "pudding"
u11.save

#===========================================================

h = Hobby.new
h.sport = 'Hiking'
h.image_url = 'http://imgur.com/pUiWM2g.png'
h.image_photo = 'http://argyruntum.com/wp-content/uploads/2014/03/hiking.jpg'
h.save

h1 = Hobby.new
h1.sport = 'Camping'
h1.image_url = 'http://imgur.com/859m2Lu.png'
h1.image_photo = 'https://i.ytimg.com/vi/vfkhlLnSq7o/maxresdefault.jpg'
h1.save

h2 = Hobby.new
h2.sport = 'Surfing'
h2.image_url = 'http://imgur.com/cVobqou.png'
h2.image_photo = 'https://images5.alphacoders.com/300/300757.jpg'
h2.save

h3 = Hobby.new
h3.sport = 'Winter Sports'
h3.image_url = 'http://imgur.com/V9Hnt2T.png'
h3.image_photo = 'http://snowbrains.com/wp-content/uploads/2014/01/url-2.jpeg'
h3.save

h4 = Hobby.new
h4.sport = 'Extreme Sports'
h4.image_url = 'http://imgur.com/jGlZE84.png'
h4.image_photo = 'https://i.ytimg.com/vi/apYEQlGlUAY/maxresdefault.jpg'
h4.save

h5 = Hobby.new
h5.sport = 'Fishing'
h5.image_url = 'http://imgur.com/aQIT0EM.png'
h5.image_photo = 'https://www.daf.qld.gov.au/__data/assets/image/0007/129742/Fisherman-fishing-at-sunset-.jpg'
h5.save

h6 = Hobby.new
h6.sport = 'Cycling'
h6.image_url = 'http://imgur.com/Skpiurj.png'
h6.image_photo = 'http://www.goodwp.com/images/201210/goodwp.com_25663.jpg'
h6.save

h7 = Hobby.new
h7.sport = 'Water Sports'
h7.image_url = 'http://imgur.com/r5O7BLq.png'
h7.image_photo = 'https://www.makemytrip.com/travel-guide/media/dg_image/hua_hin/Water-Sport_2.jpg'
h7.save

h8 = Hobby.new
h8.sport = 'Off-Roading'
h8.image_url = 'http://imgur.com/Dts94OZ.png'
h8.image_photo = 'https://i.ytimg.com/vi/YV6Co8DWvYU/maxresdefault.jpg'
h8.save

h9 = Hobby.new
h9.sport = 'Snorkling/Scuba'
h9.image_url = 'http://imgur.com/2R5UsAM.png'
h9.image_photo = 'http://www.watersportspc.com/images/snorkeling_4.jpg'
h9.save

#=================================================

e = Event.new
e.listing = 'Fishing on Yarra River'
e.location = 'Yarra Bend Park'
e.latitude = -37.9938
e.longitude = 145.31010
e.state = 'Victoria'
e.attendees = 5
e.hobby_id = 6
e.description = 'Looking for fishing enthusiasts to join me on my paddle boat to fish in the Yarra River.  We will plan to meet at Yarra Bend Park entrance bright and early at 5am to get the best fish from this brown river!'
e.date = '2016-09-01'
e.save

e1 = Event.new
e1.listing = 'Off Roading Expedition'
e1.location = 'Yarra Valley'
e1.latitude = -37.1568984
e1.longitude = 145.4272401
e1.state = 'Victoria'
e1.attendees = 3
e1.hobby_id = 7
e1.description = 'I love off roading in my new Jeep!  Would love company on an afternoon off roading excursion.  Maybe even a kangaroo siting!  Will send out meet up logistics a week before our adventure.'
e1.date = '2016-10-01'
e1.save

e2 = Event.new
e2.listing = 'Large Group Hike'
e2.location = 'Dandenong Ranges'
e2.latitude = -37.833333
e2.longitude = 145.35
e2.state = 'Victoria'
e2.attendees = 20
e2.hobby_id = 1
e2.description = 'All are welcome on this group hike through the range.  The view cannot be beat!'
e2.date = '2016-11-15'
e2.save

e3 = Event.new
e3.listing = 'Fishing from St Kilda Pier'
e3.location = 'St Kilda Pier'
e3.latitude = -37.8646
e3.longitude = 144.9677
e3.state = 'Victoria'
e3.attendees = 6
e3.hobby_id = 6
e3.description = 'Fish off the pier in beautiful St Kilda.  Best fishing in the city, and a nice view of the skyline!'
e3.date = '2016-09-04'
e3.save

e4 = Event.new
e4.listing = 'Prahan Bike Ride'
e4.location = 'Prahan Park'
e4.latitude = -37.8520
e4.longitude = 144.9980
e4.state = 'Victoria'
e4.attendees = 10
e4.hobby_id = 7
e4.description = 'All are welcome to this leisurely bike ride in beautiful Prahan!  No need to be a skilled cyclist, this will not be strenuous.  We will plan to do happy hour post ride.'
e4.date = '2016-10-16'
e4.save

e5 = Event.new
e5.listing = 'Wind Surfing'
e5.location = 'St Kilda Beach'
e5.latitude = -37.8679
e5.longitude = 144.9740
e5.state = 'Victoria'
e5.attendees = 4
e5.hobby_id = 3
e5.description = 'Looking for fellow seasoned wind surfers for one final outing in St Kilda before it gets cold this winter.  Should be narly mate!'
e5.date = '2016-09-10'
e5.save
