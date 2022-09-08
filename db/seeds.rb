# coding: utf-8

User.create!(name: "Sample User",
    email: "sample@email.com",
    password: "password",
    password_confirmation: "password",
    admin: true)

60.times do |n|
name  = Faker::Name.name
email = "sample-#{n+1}@email.com"
password = "password"
User.create!(name: name,
      email: email,
      password: password,
      password_confirmation: password)
end

50.times do |n|
    pdca = "タスク#{n + 1}"
    dp = "タスク詳細#{n + 1}"
    # admin_user.tasks.create!(name: task_name, description: description)
    # guest_user.tasks.create!(name: task_name, description: description)
end

# 50.times do |n|
#     pdca_name = "タスク#{n + 1}"
# end

# puts "Pdcas Created"