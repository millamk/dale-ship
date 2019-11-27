require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be laoded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shipper.destroy_all
Freight.destroy_all
Carrier.destroy_all
User.destroy_all

10.times do |i|
user = User.create!(email: "teste#{i}@teste.com", password: "123123")
end

puts 'Creating shippers and carriers...'

1.times do
	Shipper.create!(
		user: User.first,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    CNPJ: "12345123451234",
    job_title: "shipper",
    company_name: "x-shipper",
    vol_freq: "2"
  )
end

1.times do
	Carrier.create!(
		user: User.first,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    CNPJ: "12345123451234",
    job_title: "shipper",
    company_name: "x-shipper",
    carrier_type: "SMB Forwarder"
  )
end

5.times do
  Freight.create!(
    carrier: Carrier.find(1),
    origin: Faker::Address.city,
    destination: Faker::Address.city,
    ready_to_load: DateTime.new(2019, 12, 30),
    type_of_shipment: "FCL",
    container_pack: "20",
    expire_date: DateTime.new(2019, 11, 22),
    price: "500"
  )
end

puts 'Finished!'
