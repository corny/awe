# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create Admin User
User.create!({:name => "Admin", :admin => true, :email => 'admin@example.com', :identity_url => 'openid.example.com/'}, :as => :admin)

# Create Users
20.times do
  name = Faker::Name.name
  User.create! \
    name:         name,
    email:        Faker::Internet.email,
    identity_url: 'openid.example.com/' + name.downcase.gsub(/\W/,'_'),
    matriculation: 100000 + rand(300000)
end

# create courses
%w( 2012 2013 ).each do |year|
  course = Course.create! \
    name:        "AWE #{year}",
    description: Faker::Lorem.paragraphs(5).join("\n")
  
  # create projects
  8.times do
    course.projects.create! \
      name:        Faker::Address.city,
      description: 4.times.map{ Faker::Lorem.paragraph(5+rand(10)) }.join("\n\n")
  end
  
  # assign users to course
  User.without_course.limit(15).each do |user|
    user.course = course
    user.save!
  end
  
  # create groups
  6.times do |i|
    group = course.groups.create_with_users(course.users.without_group.limit(2))
    
    group.project = course.projects[i]
    group.save!
  end
  
end

