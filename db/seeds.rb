require "open-uri"
require "nokogiri"

PhotoCategory.destroy_all
Collaboration.destroy_all
Picture.destroy_all
Category.destroy_all
User.destroy_all
Message.destroy_all
Chatroom.destroy_all

BOITIERS = ["Sony A7 IV", "Fujifilm X-T4", "Canon EOS R6", "OM System OM-1", "Nikon Z6 II", "Fujifilm X-S10", "Nikon Z fc", "Canon EOS R5", "Fujifilm X100V", "Canon EOS R3"]
OBJECTIFS = ["11-24mm", "15-45mm", "28-75mm", "50mm", "18-135mm", "50-140mm", "55-250mm", "70-200mm", "100mm", "100-300mm"]
OUVERTURES = %w[f/1.4 f/1.8 f/2.0 f/2.8 f/4.0 f/5.6 f/8.0 f/11.0 f/14.0 f/16.0] # plus petite est la valeur, plus lumineuse est l'image et moins la profondeur de champ est grande)
TEMPS_POSES = %w[1/60s 1/80s 1/100s 1/125s 1/160s 1/200s 1/250s 1/320s 1/400s 1/500s 1/1000s]
SENSIBILITES = %w[100 125 160 200 250 320 400 500 640 800 1000 1250 1600 2000 2500 3200 4000 5000 6400 8000 10000 12800]

# USER SEEDS

paul = User.new(first_name: 'Paul', last_name: 'Portier', username:'Paul', email: 'paul@photocycle.com', password: 'azerty')
paul.bio = 'Pour moi, la photographie est un médium d’expression créative capable de saisir l’instant. Mon objectif est de capturer mes sujets dans leur environnement qui fait ressortir leur essence.'
img = URI.open('https://ca.slack-edge.com/T02NE0241-UP3USJP7F-55bf4dafd2c6-512')
paul.photo.attach(io: img, filename: "paul.jpg", content_type: 'image/jpg')
paul.save!

jeremy = User.new(first_name: 'Jeremy', last_name: 'Barbedienne', username:'Jeremy', email: 'jeremy@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-U010LE2G2MV-875acd0f9038-512')
jeremy.photo.attach(io: img, filename: "jeremy.jpg", content_type: 'image/jpg')
jeremy.save!

nadia = User.new(first_name: 'Nadia', last_name: 'Auger', username:'Nadia', email: 'nadia@photocycle.com', password: 'azerty')
nadia.bio = "Attirée par la photographie et le reportage, j'expérimente les différents aspects de mon art, en veillant à ce que l’histoire ait un sens prédominant. J'aime transmettre de l’émotion par le biais d’une photographie sensible et envoûtante."
img = URI.open('https://ca.slack-edge.com/T02NE0241-UP65W8HLN-3e225350d956-192')
nadia.photo.attach(io: img, filename: "nadia.jpg", content_type: 'image/jpg')
nadia.save!

claire = User.new(first_name: 'Claire', last_name: 'Ziemendorf', username:'Claire', email: 'claire@photocycle.com', password: 'azerty')
img = URI.open('https://ca.slack-edge.com/T02NE0241-UBNBUGXV4-1097582501e0-512')
claire.photo.attach(io: img, filename: "claire.jpg", content_type: 'image/jpg')
claire.save!

alex = User.new(first_name: 'Alex', last_name: 'Platteeuw', username:'Alex', email: 'alex@photocycle.com', password: 'azerty')
alex.bio = "Le desert offre des étendues dédiées à l'exploration et à l'aventure. Je voyage à la recherche des plus majestueux du monde"
img = URI.open('https://ca.slack-edge.com/T02NE0241-UTTF8GQEA-eb5b4e5ee120-512')
alex.photo.attach(io: img, filename: "alex.jpg", content_type: 'image/jpg')
alex.save!

kenza = User.new(first_name: 'Kenza', last_name: 'Tighrine', username:'Kenza', email: 'kenza@photocycle.com', password: 'azerty')
kenza.bio = 'Je mets ma vision artistique au profit des architectes et designers afin de mettre en avant les valeurs de leurs réalisations. J\'aimerais évoluer du paysage urbain vers le paysage naturel.'
img = URI.open('https://ca.slack-edge.com/T02NE0241-U02TEDFTQSE-01f1581d081f-512')
kenza.photo.attach(io: img, filename: "kenza.jpg", content_type: 'image/jpg')
kenza.save!

bruno = User.new(first_name: 'Bruno', last_name: 'Le Lay', username:'Bruno', email: 'bruno@photocycle.com', password: 'azerty')
bruno.bio = 'Sur Terre, de la glace peut être trouvée sur tous les continents. Son étonnant rapport à la lumière me fascine, et je voyage de l\'Himalaya à l\'Alaska en passant par le Chili pour explorer ses plus beaux paysages.'
img = URI.open('https://ca.slack-edge.com/T02NE0241-U02UW1859ME-41c79280d179-512')
bruno.photo.attach(io: img, filename: "bruno.jpg", content_type: 'image/jpg')
bruno.save!

aicha = User.new(first_name: 'Aicha', last_name: 'Diagne', username:'Aicha', email: 'aicha@photocycle.com', password: 'azerty')
aicha.bio = 'Amoureuse de la flore et des forêts, je voyage à travers l\'Europe pour les capturer. Intéressée par tout projet où la nature est au centre.'
img = URI.open('https://ca.slack-edge.com/T02NE0241-U02TPH1HNK1-32225ca26924-512')
aicha.photo.attach(io: img, filename: "aicha.jpg", content_type: 'image/jpg')
aicha.save!

# CATEGORY SEEDS
portrait = Category.create(name: "Portrait") #Paul #nadia

landscape = Category.create(name: "Landscape") # Alex - Aicha - Jeremy

animal = Category.create(name: "Animal")

black_and_white = Category.create(name: "Black & White")

desert = Category.create(name: "Desert") #Alex

forest = Category.create(name: "Forest") #Aicha

polar = Category.create(name: "Polar") #Bruno

ancient = Category.create(name: "Ancient") #nadia

architecture = Category.create(name: 'Architecture')


# MESSAGE SEEDS
puts "Creating Nadia-Bruno chatroom"
chatroomnb = Chatroom.create(first_user_id: nadia.id, second_user_id: bruno.id)
chatroomnb.save!

puts "Creating Nadia-Bruno message"
nadia_bruno = Message.create(chatroom_id: chatroomnb.id, sender_id: nadia.id, content: "Hey Bruno, j'ai vu que tu étais allé en Arctique. Est-ce qu'il faisait froid?")
nadia_bruno.save!

puts "Creating Kenza-Bruno chatroom"
chatroomkb = Chatroom.create(first_user_id: kenza.id, second_user_id: bruno.id)
chatroomkb.save!

puts "Creating Kenza-Bruno messages"
kenza_bruno = Message.create(chatroom_id: chatroomkb.id, sender_id: kenza.id, content: "Hello, alors ce Jet lag? ")
kenza_bruno.save!

kenza_bruno = Message.create(chatroom_id: chatroomkb.id, sender_id: bruno.id, content: "Haha, vraiment top cette expédition")
kenza_bruno.save!

kenza_bruno = Message.create(chatroom_id: chatroomkb.id, sender_id: kenza.id, content: "Oui, une superbe expérience ! ")
kenza_bruno.save!

kenza_bruno = Message.create(chatroom_id: chatroomkb.id, sender_id: bruno.id, content: "D'ailleurs, est-ce que tu avais pu retoucher les dernières photos? ")
kenza_bruno.save!

#ok
# PORTRAIT PAUL
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1560787313-5dff3307e257?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1504553101389-41a8f048c3ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=523&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!

#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1444069069008-83a57aac43ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1518200925927-aa63b1e57a84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1549150712-1d243024db80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1488820098099-8d4a4723a490?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1599925002316-82ab470937ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!


#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1544124094-8aea0374da93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1562457753-6867bda028cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=866&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1594675610570-c0fdddad6167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1536896407451-6e3dd976edd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1552113125-81af17f36b57?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!



new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1441886367417-1c946b32a980?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1651097681179-c64917595ff2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1542513217-0b0eedf7005d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1514218698632-ef079aeae842?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=571&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1493106819501-66d381c466f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1504199367641-aba8151af406?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1617298670466-d4228178f0b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1530785602389-07594beb8b73?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1587397845856-e6cf49176c70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1506863530036-1efeddceb993?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=744&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul

new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1520584229410-24ebf86ad31c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul
new_pic.boitier = BOITIERS.sample
new_pic.objectif = OBJECTIFS.sample
new_pic.ouverture = OUVERTURES.sample
new_pic.temps_pose = TEMPS_POSES.sample
new_pic.sensibilite = SENSIBILITES.sample
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1592576543332-120a87723830?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul
new_pic.boitier = BOITIERS.sample
new_pic.objectif = OBJECTIFS.sample
new_pic.ouverture = OUVERTURES.sample
new_pic.temps_pose = TEMPS_POSES.sample
new_pic.sensibilite = SENSIBILITES.sample
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!

#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1504904488824-dbeda3cb530b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul
new_pic.boitier = BOITIERS.sample
new_pic.objectif = OBJECTIFS.sample
new_pic.ouverture = OUVERTURES.sample
new_pic.temps_pose = TEMPS_POSES.sample
new_pic.sensibilite = SENSIBILITES.sample
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!


#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1511933617088-859b414f00ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=389&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul
new_pic.boitier = BOITIERS.sample
new_pic.objectif = OBJECTIFS.sample
new_pic.ouverture = OUVERTURES.sample
new_pic.temps_pose = TEMPS_POSES.sample
new_pic.sensibilite = SENSIBILITES.sample
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!


new_pic = Picture.new
img_url = 'https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
puts "Creating photo..."
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save

#NB
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1529690352690-1a85af03cc98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = black_and_white
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1539614474468-f423a2d2270c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = paul
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = portrait
new_pic_category.save!


# Aicha FOREST
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1508788397430-55907b348ba8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1493166228553-4fa0fdb916e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1501084291732-13b1ba8f0ebc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=868&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1454982523318-4b6396f39d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1485067801970-70573e3f77d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1621960531176-9e4894d9adf8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1622722361764-5ca270397621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1603130925403-41d4536d415f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1606051780861-33c1d0a0d8ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1593069567131-53a0614dde1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1500308806058-9eb40154a774?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1510797215324-95aa89f43c33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1599940824399-b87987ceb72a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1595257547890-2191e7d276b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1543964256-d1194f65dc23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1599940824219-e6aa9be5fba2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1503903587778-5124b6d043b8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!



new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1522764725576-4cbbbf12c16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1559770968-53924e9b32de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1454425064867-5ba516caf601?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1504560316116-f7815ebb9c5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1511497584788-876760111969?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1621014882370-0138438e9a67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=887&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1596523521208-146d9ccc505f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=370&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1507614498949-edbabc86a14f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1473773508845-188df298d2d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1508246325515-244d9d3a2b08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1527701963793-33e969bca5ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = aicha
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = forest
new_pic_category.save!


#DESERTALEX

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1627932224565-950d571b539c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1615423440514-187bce570647?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1568323993228-2e26982287a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1579772991680-1194ef83d407?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = animal
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1566622219044-7948b6b7745e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1451418280345-67a6b4d10bba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1598898065100-a762ef6d142b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1582213943969-8ab299b3225a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1596625820723-f0f481ff80be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1583023489019-670278c3752d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1526662756420-76da8f67f7aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1534559733674-bf89abe1dda5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1596719033520-39451c977876?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1516481605912-d34c1411504c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1505521377774-103a8cc2f735?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1564107628966-daff03746bee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1467745870897-1f66443c8c04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=354&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1615720179640-4108e75055e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = animal
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1510711547938-04fb9010e471?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1616443586071-cd1f0a65ef5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1502596976448-661a8925673a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1519764421498-5353daa00726?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1502471975172-e7b1ec41fd8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1532530047017-dd28913dc4b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1553326875-1a32421b5e36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1530871485912-310c2ac29b80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=456&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = alex
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = desert
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = animal
new_pic_category.save!


#POLAR BRUNO
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1547321214-d540f231f955?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1617889963259-a7feede244da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1558737429-b16a3f519860?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1547454876-9c75be28f80d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=941&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = animal
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1549598685-0058b114c9d6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1622032493435-8bb0706ab31f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1551415923-31d2072bc248?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1599151008654-2a77bfd5b788?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1504599787388-de6cd17b7659?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = animal
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1545354628-c454465de722?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1543470366-01327539f26a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1543470388-80a8f5281639?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1543470356-691a4e932cde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1582699011340-21e302507754?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1470520518831-10005602ab67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1638971057743-ee14ac15b08a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=433&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1589656966895-2f33e7653819?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = animal
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1504964306813-50d4333f6968?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1509122696753-d01769640838?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1249&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1569402921928-5cecbd675665?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1496340077100-9573d8b77463?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=883&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1493329306594-38b6b1cd381f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1543470366-01327539f26a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1543470388-80a8f5281639?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1536745287225-21d689278fd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1648460417084-93a9477f2841?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=770&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = animal
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1641949212032-d9b8b16334e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1494564605686-2e931f77a8e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1470093851219-69951fcbb533?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = bruno
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = landscape
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = polar
new_pic_category.save!


#ancient nadia
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1557796444-36beb1788508?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1500209690208-15084dbf0c57?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=850&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1651841407729-b44ccf9bdd9e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1621260092131-d6d9165687c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1598114863212-aa4a9ad0db82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1629947174144-a9841b67af34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1509317379708-15f810448a0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1522258493909-bf27c8ebd64a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=355&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1541783677340-d3d95e61e3f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=877&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1540525080980-b97c4be3c779?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1616031744229-97c89cedfa11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1580102488613-fa55ab5de62a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1415804941191-bc0c3bbac10d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1568542368937-3231dbde2662?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1500120194857-62b493650979?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1527960299979-ae13298358b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=946&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1623473882999-2f33d6fc1d09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=930&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1522787345986-d5c7885a889e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1534759949531-7d6a567c33a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1600023062179-6c6b954698cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=359&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1623570147270-ddf7d7438b3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1507475380673-1246fa72eeea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1602988144638-d26880bc9361?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1529276426793-9c2dfd01d127?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1564506944663-2260117a8d89?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1604147859737-e338c5b919c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=975&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1420824471541-fe7e0ae0baa4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1606403759369-e10299ed5740?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1650347648000-b9a0581a147f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = nadia
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = ancient
new_pic_category.save!

#Kenken
new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1560131653-63257db002c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = kenza
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1625447521754-764d517239e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = kenza
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1516490544528-22091aa72ac8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = kenza
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1518893228544-d6c4eee24344?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = kenza
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1564803464063-9656b41896b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=474&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = kenza
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!

new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1625153494797-0fe435e827ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = kenza
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!


new_pic = Picture.new
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1613598764441-f07ca44c30ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
new_pic.photo.attach(io: file, filename: "#{new_pic.id}.jpg", content_type: 'image/jpg')
new_pic.user = kenza
new_pic.save!
new_pic_category = PhotoCategory.new
new_pic_category.picture = new_pic
new_pic_category.category = architecture
new_pic_category.save!

# Adding technical details to all pictures
all_photos = Picture.all
all_photos.each do |pic|
  pic.boitier = BOITIERS.sample
  pic.objectif = OBJECTIFS.sample
  pic.ouverture = OUVERTURES.sample
  pic.temps_pose = TEMPS_POSES.sample
  pic.sensibilite = SENSIBILITES.sample
  pic.save!
end

# COLLABORATIONS SEEDS
puts "Creating Nadia-Bruno collab request"
collab = Collaboration.new(name: 'Vestiges', artist1_id: nadia.id, artist2_id: bruno.id, status: 0)
collab.description = "Hello Bruno, je vais en bientôt en Antarctique pour photographier des vestiges. Intéressé?"
collab.save!

puts "Creating Paul-Aicha collab"
collab = Collaboration.new(name: 'Breathe', artist1: paul, artist2: aicha, status: 1)
collab.story = "How do you feel in the middle of trees? Peaceful, serene, and content.
Through Breathe, Paul Portier and Aïcha Diagne merge their talents to remind us of the
importance of reconnecting with greenery."
collab.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1505312904023-e4c5d6fcfa4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1776&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = paul
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = portrait
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = forest
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1638148870156-b67e32b90938?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = paul
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = portrait
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = forest
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1541216970279-affbfdd55aa8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = paul
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = portrait
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = forest
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1492581654245-5a258fbbecce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = paul
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = portrait
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = forest
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1633116182263-d47d11023c9c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = paul
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = portrait
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = forest
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1614199484820-909ad394894d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = paul
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = portrait
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = forest
collab_pic_category.save!


#collab Bruno X Kenza

collab = Collaboration.new(name: 'Under the snow', artist1: bruno, artist2: kenza, status: 1)
collab.story = "There aren't many things more magical than seeing snow covering beautiful architecture.
                Bruno Le Lay and Kenza Tighrine transport us to a world of fantasy through the capture
                of this enchanting meeting."
collab.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1518374895823-ee01662288c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = bruno
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = architecture
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = polar
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1611602132416-da2045990f76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = bruno
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = architecture
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = polar
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1519422368538-125f62622596?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = bruno
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = architecture
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = polar
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1545631828-c9023a782bd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=343&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = bruno
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = architecture
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = polar
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1576837841473-320cd3fc8a19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = bruno
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = architecture
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = polar
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1610928290695-64e621f6a2f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = bruno
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = architecture
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = polar
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1521898208365-d7bd8e1ad280?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=413&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = bruno
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = architecture
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = polar
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1604210565264-8917562a63d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = bruno
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = architecture
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = polar
collab_pic_category.save!

collab_pic = Picture.new
collab_pic.collaboration = collab
puts "Creating photo..."
img_url = 'https://images.unsplash.com/photo-1583381707566-5e3062289547?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'
file = URI.open(img_url)
collab_pic.photo.attach(io: file, filename: "#{collab_pic.id}.jpg", content_type: 'image/jpg')
collab_pic.user = bruno
collab_pic.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = architecture
collab_pic_category.save!
collab_pic_category = PhotoCategory.new
collab_pic_category.picture = collab_pic
collab_pic_category.category = polar
collab_pic_category.save!
