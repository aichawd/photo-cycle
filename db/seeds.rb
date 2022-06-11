require "open-uri"
require "nokogiri"

PhotoCategory.destroy_all
Picture.destroy_all
Category.destroy_all
User.destroy_all

# User.new(first_name: , last_name: , email: , password: )

paul = User.new(first_name: 'Paul', last_name: 'Portier', username:'Paul', email: 'paul@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-UP3USJP7F-55bf4dafd2c6-512')
paul.photo.attach(io: img, filename: "paul.jpg", content_type: 'image/jpg')
paul.save!

jeremy = User.new(first_name: 'Jeremy', last_name: 'Barbedienne', username:'Jeremy', email: 'jeremy@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U010LE2G2MV-875acd0f9038-512')
jeremy.photo.attach(io: img, filename: "jeremy.jpg", content_type: 'image/jpg')
jeremy.save!

charlotte = User.new(first_name: 'Charlotte', last_name: 'Bory', username:'Charlotte', email: 'charlotte@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U01HWUHQEMQ-c92da5718288-512')
charlotte.photo.attach(io: img, filename: "charlotte.jpg", content_type: 'image/jpg')
charlotte.save!

claire = User.new(first_name: 'Claire', last_name: 'Ziemendorf', username:'Claire', email: 'claire@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-UBNBUGXV4-1097582501e0-512')
claire.photo.attach(io: img, filename: "claire.jpg", content_type: 'image/jpg')
claire.save!

alex = User.new(first_name: 'Alex', last_name: 'Platteeuw', username:'Alex', email: 'alex@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-UTTF8GQEA-eb5b4e5ee120-512')
alex.photo.attach(io: img, filename: "alex.jpg", content_type: 'image/jpg')
alex.save!

kenza = User.new(first_name: 'Kenza', last_name: 'Tighrine', username:'Kenza', email: 'kenza@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U02TEDFTQSE-01f1581d081f-512')
kenza.photo.attach(io: img, filename: "kenza.jpg", content_type: 'image/jpg')
kenza.save!

bruno = User.new(first_name: 'Bruno', last_name: 'Le Lay', username:'Bruno', email: 'bruno@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U02UW1859ME-41c79280d179-512')
bruno.photo.attach(io: img, filename: "bruno.jpg", content_type: 'image/jpg')
bruno.save!

aicha = User.new(first_name: 'Aicha', last_name: 'Diagne', username:'Aicha', email: 'aicha@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U02TPH1HNK1-32225ca26924-512')
aicha.photo.attach(io: img, filename: "aicha.jpg", content_type: 'image/jpg')
aicha.save!

# create categories
portrait = Category.create(name: "Portrait")

landscape = Category.create(name: "Landscape")

black_and_white = Category.create(name: "Black & White")

desert = Category.create(name: "Desert")

forest = Category.create(name: "Forest")

beach = Category.create(name: "Beach")


# ************************** TOUTES LES PHOTOS SONT AU FORMAT 387 - 460 - 520 + 2photos à 800 *********************************



# PORTRAIT PAUL X BRUNO
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1560787313-5dff3307e257?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save! 
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1444069069008-83a57aac43ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=460&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#3SQUARE
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1549150712-1d243024db80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1488820098099-8d4a4723a490?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=520&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#5
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1599925002316-82ab470937ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=460&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1544124094-8aea0374da93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!



photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1562457753-6867bda028cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=520&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#SQUARE
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1578176603894-57973e38890f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=460&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!



photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1578254090783-31fa81462b73?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=520&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


#10
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1441886367417-1c946b32a980?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=460&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!



photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1651097681179-c64917595ff2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1525599428495-0441bd5c67de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=460&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#SQUARE
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1514218698632-ef079aeae842?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=520&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1587397845856-e6cf49176c70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=520&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


#15
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1493106819501-66d381c466f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=460&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1578069187179-16318dcdd0ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1504904488824-dbeda3cb530b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=460&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!



photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1520584229410-24ebf86ad31c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=520&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1578307362674-b209690512c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#20
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1524037788347-61fffad67935?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=460&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

=begin
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1592576543332-120a87723830?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!
=end



#photo_unsplash = Picture.new
#img_url = 'https://images.unsplash.com/photo-1589837396034-518c01de601a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80'
#file = URI.open(img_url)
#photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
#photo_unsplash.user = paul
#photo_unsplash.save!
#photo_unsplash_category = PhotoCategory.new
#photo_unsplash_category.picture = photo_unsplash
#photo_unsplash_category.category = portrait
#photo_unsplash_category.save!


#23
=begin
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1517202383675-eb0a6e27775f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=460&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!
=end

=begin
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1515718533743-254052bbf4bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!
=end



# Landscape aicha
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1515718486653-d63accc9cb3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!



photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1515718581503-6a846ee00040?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1441990912087-4acb4d2d1d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1562095241-8c6714fd4178?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!
