#By using the symbol ':user', we get the Factory Girl to simulate the user model
Factory.define :user do |user|
  user.name "Michael Hartl"
  user.email "mhart@example.com"
  user.password "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
