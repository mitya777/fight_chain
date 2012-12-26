namespace :db do
  desc "Initialize databse with default tags"
  task :init_tags => :environment do
     create_default_tags 
  end
end


def create_default_tags
  Tag.default_tags().each do |tag|
    Tag.create! tag unless Tag.find_by_name tag[:name]
  end
end
