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

nadia = User.new(first_name: 'nadia', last_name: 'Auger', username:'Nadia', email: 'nadia@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-UP65W8HLN-3e225350d956-192')
nadia.photo.attach(io: img, filename: "nadia.jpg", content_type: 'image/jpg')
nadia.save!

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
portrait = Category.create(name: "Portrait") #Paul #nadia

landscape = Category.create(name: "Landscape") # Alex - Aicha - Jeremy


#black_and_white = Category.create(name: "Black & White")

desert = Category.create(name: "Desert") #Alex

forest = Category.create(name: "Forest") #Aicha

polar = Category.create(name: "Polar") #Bruno

ancient = Category.create(name: "Ancient") #nadia


# ************************** TOUTES LES PHOTOS SONT AU FORMAT 387 - 460 - 520 + 2photos à 800 *********************************


#ok
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
img_url = 'https://images.unsplash.com/photo-1504553101389-41a8f048c3ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=523&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1444069069008-83a57aac43ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!



#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1518200925927-aa63b1e57a84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1549150712-1d243024db80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1488820098099-8d4a4723a490?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!



#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1599925002316-82ab470937ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1544124094-8aea0374da93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1562457753-6867bda028cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=866&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1594675610570-c0fdddad6167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1536896407451-6e3dd976edd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1552113125-81af17f36b57?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1441886367417-1c946b32a980?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
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

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1542513217-0b0eedf7005d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1514218698632-ef079aeae842?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=571&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok switch w/young
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1493106819501-66d381c466f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1504199367641-aba8151af406?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
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
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!
=end



photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1617298670466-d4228178f0b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1530785602389-07594beb8b73?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1587397845856-e6cf49176c70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1506863530036-1efeddceb993?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=744&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1520584229410-24ebf86ad31c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1592576543332-120a87723830?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!

#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1504904488824-dbeda3cb530b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1511933617088-859b414f00ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=389&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save


#ok
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1529690352690-1a85af03cc98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1539614474468-f423a2d2270c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = paul
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = portrait
photo_unsplash_category.save!



# Aicha FOREST
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1508788397430-55907b348ba8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = forest
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1493166228553-4fa0fdb916e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1501084291732-13b1ba8f0ebc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=868&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1454982523318-4b6396f39d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1485067801970-70573e3f77d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1621960531176-9e4894d9adf8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1622722361764-5ca270397621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1603130925403-41d4536d415f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1606051780861-33c1d0a0d8ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1593069567131-53a0614dde1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1500308806058-9eb40154a774?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1510797215324-95aa89f43c33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1599940824399-b87987ceb72a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1595257547890-2191e7d276b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1543964256-d1194f65dc23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1599940824219-e6aa9be5fba2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1503903587778-5124b6d043b8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!



photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1522764725576-4cbbbf12c16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1559770968-53924e9b32de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1454425064867-5ba516caf601?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1504560316116-f7815ebb9c5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1511497584788-876760111969?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1621014882370-0138438e9a67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=887&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1596523521208-146d9ccc505f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=370&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1507614498949-edbabc86a14f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1473773508845-188df298d2d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1508246325515-244d9d3a2b08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1527701963793-33e969bca5ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = aicha
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = landscape
photo_unsplash_category.save!


#DESERTALEX

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1627932224565-950d571b539c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1615423440514-187bce570647?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1568323993228-2e26982287a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1579772991680-1194ef83d407?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1566622219044-7948b6b7745e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1451418280345-67a6b4d10bba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1598898065100-a762ef6d142b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1582213943969-8ab299b3225a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1596625820723-f0f481ff80be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1583023489019-670278c3752d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1526662756420-76da8f67f7aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1534559733674-bf89abe1dda5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1596719033520-39451c977876?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1516481605912-d34c1411504c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1505521377774-103a8cc2f735?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1564107628966-daff03746bee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1467745870897-1f66443c8c04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=354&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1615720179640-4108e75055e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1510711547938-04fb9010e471?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1616443586071-cd1f0a65ef5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1502596976448-661a8925673a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1519764421498-5353daa00726?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1502471975172-e7b1ec41fd8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1532530047017-dd28913dc4b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1553326875-1a32421b5e36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = alex
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = desert
photo_unsplash_category.save!




#POLAR BRUNO
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1547321214-d540f231f955?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1617889963259-a7feede244da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1558737429-b16a3f519860?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1547454876-9c75be28f80d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=941&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1549598685-0058b114c9d6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1622032493435-8bb0706ab31f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1551415923-31d2072bc248?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1599151008654-2a77bfd5b788?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1504599787388-de6cd17b7659?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1545354628-c454465de722?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1543470366-01327539f26a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1543470388-80a8f5281639?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1543470356-691a4e932cde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1582699011340-21e302507754?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1470520518831-10005602ab67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1638971057743-ee14ac15b08a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=433&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1589656966895-2f33e7653819?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1504964306813-50d4333f6968?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1509122696753-d01769640838?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1249&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1569402921928-5cecbd675665?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1496340077100-9573d8b77463?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=883&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1493329306594-38b6b1cd381f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1543470366-01327539f26a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1543470388-80a8f5281639?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1536745287225-21d689278fd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1648460417084-93a9477f2841?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=770&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1641949212032-d9b8b16334e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1494564605686-2e931f77a8e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1470093851219-69951fcbb533?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = bruno
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = polar
photo_unsplash_category.save!


#ancient nadia
photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1557796444-36beb1788508?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1500209690208-15084dbf0c57?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=850&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1651841407729-b44ccf9bdd9e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1621260092131-d6d9165687c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1598114863212-aa4a9ad0db82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1629947174144-a9841b67af34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1509317379708-15f810448a0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1522258493909-bf27c8ebd64a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=355&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1541783677340-d3d95e61e3f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=877&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1540525080980-b97c4be3c779?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1616031744229-97c89cedfa11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1580102488613-fa55ab5de62a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1415804941191-bc0c3bbac10d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1568542368937-3231dbde2662?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1500120194857-62b493650979?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1527960299979-ae13298358b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=946&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1623473882999-2f33d6fc1d09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=930&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1522787345986-d5c7885a889e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1534759949531-7d6a567c33a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1600023062179-6c6b954698cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=359&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1623570147270-ddf7d7438b3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1507475380673-1246fa72eeea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1602988144638-d26880bc9361?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1529276426793-9c2dfd01d127?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1564506944663-2260117a8d89?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1604147859737-e338c5b919c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=975&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1420824471541-fe7e0ae0baa4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1606403759369-e10299ed5740?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = 'https://images.unsplash.com/photo-1650347648000-b9a0581a147f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

=begin
photo_unsplash = Picture.new
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!

photo_unsplash = Picture.new
img_url = ''
file = URI.open(img_url)
photo_unsplash.photo.attach(io: file, filename: "#{photo_unsplash.id}.jpg", content_type: 'image/jpg')
photo_unsplash.user = nadia
photo_unsplash.save!
photo_unsplash_category = PhotoCategory.new
photo_unsplash_category.picture = photo_unsplash
photo_unsplash_category.category = ancient
photo_unsplash_category.save!
=end
