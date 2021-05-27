# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed the basic trades
# ProfileTrade.destroy_all

User.destroy_all

Trade.destroy_all
trades = [
  { name: "Plumber" },
  { name: "Telecommunications" },
  { name: "Painter" },
  { name: "Plasterer" },
  { name: "Carpenter" },
  { name: "Electrician" },
  { name: "Other" }
]
Trade.create(trades)

# Seed the standard roles
Role.destroy_all
roles = [
  { name: "admin" },
  { name: "user" },
  { name: "tradie" }
]
Role.create(roles)

# Seed the states
State.destroy_all
states = [
  { name: "NSW" },
  { name: "ACT" },
  { name: "VIC" },
  { name: "QLD" },
  { name: "SA" },
  { name: "WA" },
  { name: "TAS" },
  { name: "NT" }
]
State.create(states)

# # Seed admin user

# Profile.destroy_all
# Address.destroy_all

user = {
  username: "admin",
  email: "admin@admin.com",
  password: "Password"
}

profile = {
  business: "Adapting Behaviour",
  trade_ids: [Trade.first.id],
  user: User.create(user)
}

addresses =
  {
    house_number: "42",
    street: "Life St",
    suburb: "Universe",
    postcode: "1000",
    state_id: State.first.id,
    profile: Profile.create(profile)
  }


Address.create(addresses)

admin = User.find_by(username: "admin")
admin.add_role :admin
admin.add_role :tradie

# creates a job for the admin user
