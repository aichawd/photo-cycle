require "open-uri"
require "nokogiri"

PhotoCategory.destroy_all
Photo.destroy_all
Category.destroy_all
User.destroy_all

# User.new(first_name: , last_name: , email: , password: )

paul = User.new(first_name: 'Paul', last_name: 'Portier', username:'Popaul', email: 'paul@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-UP3USJP7F-55bf4dafd2c6-512')
paul.photo.attach(io: img, filename: "paul.jpg", content_type: 'image/jpg')
paul.save!

jeremy = User.new(first_name: 'Jeremy', last_name: 'Barbedienne', username:'Jerebarbe', email: 'jeremy@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U010LE2G2MV-875acd0f9038-512')
jeremy.photo.attach(io: img, filename: "jeremy.jpg", content_type: 'image/jpg')
jeremy.save!

charlotte = User.new(first_name: 'Charlotte', last_name: 'Bory', username:'Chacha', email: 'charlotte@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U01HWUHQEMQ-c92da5718288-512')
charlotte.photo.attach(io: img, filename: "charlotte.jpg", content_type: 'image/jpg')
charlotte.save!

claire = User.new(first_name: 'Claire', last_name: 'Ziemendorf', username:'ClaireZ', email: 'claire@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-UBNBUGXV4-1097582501e0-512')
claire.photo.attach(io: img, filename: "claire.jpg", content_type: 'image/jpg')
claire.save!

alex = User.new(first_name: 'Alex', last_name: 'Platteeuw', username:'the_Plat', email: 'alex@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-UTTF8GQEA-eb5b4e5ee120-512')
alex.photo.attach(io: img, filename: "alex.jpg", content_type: 'image/jpg')
alex.save!

kenza = User.new(first_name: 'Kenza', last_name: 'Tighrine', username:'Kenzouche', email: 'kenza@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U02TEDFTQSE-01f1581d081f-512')
kenza.photo.attach(io: img, filename: "kenza.jpg", content_type: 'image/jpg')
kenza.save!

bruno = User.new(first_name: 'Bruno', last_name: 'Le Lay', username:'Bru_music', email: 'bruno@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U02UW1859ME-41c79280d179-512')
bruno.photo.attach(io: img, filename: "bruno.jpg", content_type: 'image/jpg')
bruno.save!

aicha = User.new(first_name: 'Aicha', last_name: 'Diagne', username:'aicha96', email: 'aicha@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U02TPH1HNK1-32225ca26924-512')
aicha.photo.attach(io: img, filename: "aicha.jpg", content_type: 'image/jpg')
aicha.save!

# create categories
Category.create(name: "Portrait")

Category.create(name: "Landscape")

Category.create(name: "Black & White")

Category.create(name: "Desert")

Category.create(name: "Forest")

Category.create(name: "Beach")

# Portraits Paul & Bruno

photo_unsplash = Photo.new
img_url = 'https://images.unsplash.com/photo-1560787313-5dff3307e257?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find(1)
photo_unsplash_category.save!



photo_unsplash = Photo.new
img_url = 'https://images.unsplash.com/photo-1444069069008-83a57aac43ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = Paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find(1)
photo_unsplash_category.save!




photo_unsplash = Photo.new
img_url = 'https://images.unsplash.com/photo-1488820098099-8d4a4723a490?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find(1)
photo_unsplash_category.save!




photo_unsplash = Photo.new
img_url = 'https://images.unsplash.com/photo-1599925002316-82ab470937ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find(1)
photo_unsplash_category.save!




photo_unsplash = Photo.new
img_url = 'https://images.unsplash.com/photo-1544124094-8aea0374da93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1400&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find(1)
photo_unsplash_category.save!




photo_unsplash = Photo.new
img_url = 'https://images.unsplash.com/photo-1562457753-6867bda028cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1466&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find(1)
photo_unsplash_category.save!




photo_unsplash = Photo.new
img_url = 'https://images.unsplash.com/photo-1578254090783-31fa81462b73?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find(1)
photo_unsplash_category.save!




photo_unsplash = Photo.new
img_url = 'https://images.unsplash.com/photo-1441886367417-1c946b32a980?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1752&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find(1)
photo_unsplash_category.save!



# Landscape Aicha & Alex
photo_unsplash = Photo.new
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = #username
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find()
photo_unsplash_category.save!




photo_unsplash = Photo.new
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = #username
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find()
photo_unsplash_category.save!



photo_unsplash = Photo.new
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = #username
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.photo = photo_unsplash
photo_unsplash_category.category = Category.find()
photo_unsplash_category.save!
