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
