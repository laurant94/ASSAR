# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = App::Faithful.create(
  firstname: "NAMEDE", 
  lastname: "Mathieu", 
  phone: "229 96789966",
  email: "nnsz@ss.sd",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa",
  role: 1,
  approved: true,
  profession: "Developpeur",
  nationality: "BJ",
  city: "Ctn",
  district: "Zogbo"
)

church = Church.create(
  name: "Mercerie des garçons kokeluches",
  acronym: "MGK",
  phone: "229 966658855",
  email: "mkg@yopmail.com",
  country: "BJ",
  city: "Cotonou",
  post_code: 1336,
  approved: true,
  foundation_date: Date.new,
  agrement: "12554454qs",
  leader_name: "Lucien Bétérav",
  manager_id: user.id
)
church.setting = Setting.new

child = Child.create(
  name: "Mercerie des garçons kokeluches Cotonou",
  acronym: "MGK Cotonou",
  phone: "229 96555458",
  city: "Cotonou",
  district: "Zogbo",
  post_code: "1336",
  manager_id: user.id,
  church: church
)

10.times do
  group = Group.create(
    name: Faker::Company.name,
    acronym: Faker::Company.suffix,
    manager: user,
    child: child
  )

end

50.times do
  f = App::Faithful.create(
    firstname: Faker::Name.first_name , 
    lastname: Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    password: "aaaaaaaa",
    password_confirmation: "aaaaaaaa",
    approved: true,
    profession: Faker::Job.title,
    nationality: "BJ",
    city: "Ctn",
    district: "Zogbo"
  )
  puts f.valid?

  child.faithfuls << f
end
