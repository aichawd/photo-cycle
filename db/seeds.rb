require "open-uri"
require "nokogiri"

Collaboration.destroy_all
Message.destroy_all
Chatroom.destroy_all

BOITIERS = ["Sony A7 IV", "Fujifilm X-T4", "Canon EOS R6", "OM System OM-1", "Nikon Z6 II", "Fujifilm X-S10", "Nikon Z fc", "Canon EOS R5", "Fujifilm X100V", "Canon EOS R3"]
OBJECTIFS = ["11-24mm", "15-45mm", "28-75mm", "50mm", "18-135mm", "50-140mm", "55-250mm", "70-200mm", "100mm", "100-300mm"]
OUVERTURES = %w[f/1.4 f/1.8 f/2.0 f/2.8 f/4.0 f/5.6 f/8.0 f/11.0 f/14.0 f/16.0] # plus petite est la valeur, plus lumineuse est l'image et moins la profondeur de champ est grande)
TEMPS_POSES = %w[1/60s 1/80s 1/100s 1/125s 1/160s 1/200s 1/250s 1/320s 1/400s 1/500s 1/1000s]
SENSIBILITES = %w[100 125 160 200 250 320 400 500 640 800 1000 1250 1600 2000 2500 3200 4000 5000 6400 8000 10000 12800]

# MESSAGE SEEDS
puts "Creating Nadia-Bruno chatroom"
chatroomnb = Chatroom.create(first_user_id: nadia.id, second_user_id: bruno.id)
chatroomnb.save!

puts "Creating Nadia-Bruno message"
nadia_bruno = Message.create(chatroom_id: chatroomnb.id, sender_id: nadia.id, content: "Hey Bruno, j'ai vu que tu étais allé en Arctique. Est-ce qu'il faisait froid?")
nadia_bruno.save!

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
