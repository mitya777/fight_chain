
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
#    require 'faker'
    Rake::Task['db:reset'].invoke
    make_users
    make_techniques
    make_technique_relationships
  end
end

def make_users
  admin = User.create!(:name => "Dmitriy Fabrikant",
                       :email => "mityaf@gmail.com",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
  25.times do |n|
    name  = Faker::Name.name
    email = Faker::Internet.email
    password  = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_techniques
  User.all.each do |user|
    51.times do
      description = Faker::Lorem.sentence
      name = Faker::Lorem.words
      t = user.techniques.create!(:description => description,
                                  :name => name)
      vname = Faker::Lorem.words
      vdescription = Faker::Lorem.sentence
      t.videos.create!(:name => vname,
                       :url => "http://www.youtube.com/watch?v=rY5eGjpGxAk&feature=related",
                       :description => vdescription)
    end
  end
end

def make_technique_relationships
  Technique.all.each do |tech|
    id = tech.id
    tech.add_child!(Technique.find_by_id(id + 1)) unless Technique.find_by_id(id + 1).nil?
    tech.add_child!(Technique.find_by_id(id + 2)) unless Technique.find_by_id(id + 2).nil?
    tech.add_child!(Technique.find_by_id(id + 3)) unless Technique.find_by_id(id + 3).nil?
  end
end

