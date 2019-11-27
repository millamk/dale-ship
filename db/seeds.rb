require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be laoded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shipper.destroy_all if Rails.env.development?
Freight.destroy_all if Rails.env.development?
Carrier.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Port.destroy_all  if Rails.env.development?

user = User.create!(email: "milla.mk@hotmail.com", password: "123456",)

Carrier.create!(
    user: user,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    CNPJ: "12345123451234",
    job_title: "shipper",
    company_name: "x-shipper",
    carrier_type: "SMB Forwarder"
  )

10.times do |i|
user = User.create!(email: "teste#{i}@teste.com", password: "123123",)
end

puts 'Creating shippers and carriers...'

5.times do
	Shipper.create!(
		user: User.all.sample,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    CNPJ: "12345123451234",
    job_title: "shipper",
    company_name: "x-shipper",
    vol_freq: "2"
  )
end

5.times do
	Carrier.create!(
		user: User.all.sample,
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
    carrier: Carrier.all.sample,
    origin: Faker::Address.city,
    destination: Faker::Address.city,
    ready_to_load: DateTime.new(2019, 12, 30),
    type_of_shipment: "FCL",
    container_pack: "20",
    expire_date: DateTime.new(2019, 11, 22),
    price: "500"
  )
end

if Rails.env.development?
  10.times do |i|
  user = User.create!(email: "teste#{i}@teste.com", password: "123123",)
  end

  puts 'Creating shippers and carriers...'

  5.times do
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

  5.times do
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

  # 5.times do
  #   Freight.create!(
  #     carrier_id: Carrier.find(17),
  #     origin: Faker::Address.city,
  #     destination: Faker::Address.city,
  #     ready_to_load: DateTime.new(2019, 12, 30),
  #     type_of_shipment: "FCL",
  #     container_pack: "20",
  #     expire_date: DateTime.new(2019, 11, 22),
  #     price: "500"
  #   )
  # end
end

Port.create!(name: 'Recife', address: 'Praça Comunidade Luso Brasileira no 70
Bairro do Recife - Recife, PE 50030-280, Brazil')
Port.create!(name: 'Manaus', address: 'R. Taqueirinha, 25 - Centro, Manaus - AM, 69005-420')
Port.create!(name: 'Fortaleza', address: 'Marfisa Maria de Aguiar Ferreira Ximenes - Praca Amigos da Marinha S/n – Mucuripe
Fortaleza, CE 60182 640 - Brazil')
Port.create!(name: 'Rio Grande', address: 'Hondrio Bicalho Ave, W/N - Mailbox 198 - Rio Grande, RS 96201-020 - Brazil')
Port.create!(name: 'Santos', address: ' Avenida Rodrigues Alves s/n Santos, Sao Baulo 11015-900 Brazil')
Port.create!(name: 'Shangai', address: '358 East Daming Road Shanghai, Shanghai 200080 China')
Port.create!(name: 'Ningbo', address: '496 Yanjiang Dong Road Ningbo, Zhejiang 315200 China')

puts 'Finished!'
