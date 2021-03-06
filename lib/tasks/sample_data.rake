namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
    make_users
    
  end
end

def make_users
  admin = User.create!(name:     "Jazib Bashir",
                       email:    "jazibbashir@gmail.com",
                       password: "jazibbashir",
                       password_confirmation: "jazibbashir",
                       admin: true)
  
end

def make_microposts
  users = User.limit(6)
  5.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end