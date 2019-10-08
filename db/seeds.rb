# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create!([{name: :ceo}, {name: :vp}, {name: :director}, {name: :manager}, {name: :sde}])

ceo_role = Role.find_by(name: :ceo)
vp_role = Role.find_by(name: :vp)
director_role = Role.find_by(name: :director)
manager_role = Role.find_by(name: :manager)
sde_role = Role.find_by(name: :sde)

ceo = Employee.create!(name: "CEO name", email: "coe@gmail.com", salary: 100000, rating: 4.5, role: ceo_role)

vp1 = ceo.children.create!(name: "VP1 name", email: "vp1@gmail.com", salary: 200000, rating: 4.4, role: vp_role)
vp2 = ceo.children.create!(name: "VP2 name", email: "vp2@gmail.com", salary: 200000, rating: 4.3, role: vp_role)

director1 = vp1.children.create!(name: "director1 name", email: "director1@gmail.com", salary: 200000, rating: 4.4, role: director_role)
director2 = vp1.children.create!(name: "director2 name", email: "director2@gmail.com", salary: 200000, rating: 4.3, role: director_role)
director3 = vp2.children.create!(name: "director3 name", email: "director3@gmail.com", salary: 200000, rating: 4.3, role: director_role)

manager1 = director1.children.create!(name: "manager1 name", email: "manager1@gmail.com", salary: 200000, rating: 4.4, role: manager_role)
manager2 = director1.children.create!(name: "manager2 name", email: "manager2@gmail.com", salary: 200000, rating: 4.4, role: manager_role)
manager3 = director3.children.create!(name: "manager3 name", email: "manager3@gmail.com", salary: 200000, rating: 4.4, role: manager_role)
manager4 = director3.children.create!(name: "manager4 name", email: "manager4@gmail.com", salary: 200000, rating: 4.4, role: manager_role)

sde1 = manager1.children.create!(name: "sde1 name", email: "sde1@gmail.com", salary: 200000, rating: 4.3, role: sde_role)
sde2 = manager1.children.create!(name: "sde2 name", email: "sde2@gmail.com", salary: 200000, rating: 4.3, role: sde_role)
sde3 = manager2.children.create!(name: "sde3 name", email: "sde3@gmail.com", salary: 200000, rating: 4.3, role: sde_role)
sde4 = manager2.children.create!(name: "sde4 name", email: "sde4@gmail.com", salary: 200000, rating: 4.3, role: sde_role)
sde5 = manager3.children.create!(name: "sde5 name", email: "sde5@gmail.com", salary: 200000, rating: 4.3, role: sde_role)
sde6 = manager3.children.create!(name: "sde6 name", email: "sde6@gmail.com", salary: 200000, rating: 4.3, role: sde_role)
sde7 = manager4.children.create!(name: "sde7 name", email: "sde7@gmail.com", salary: 200000, rating: 4.3, role: sde_role)
sde8 = manager4.children.create!(name: "sde8 name", email: "sde8@gmail.com", salary: 200000, rating: 4.3, role: sde_role)