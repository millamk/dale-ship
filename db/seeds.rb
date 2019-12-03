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
Port.destroy_all

  puts 'Creating shippers and carriers...'
  10.times do |i|
    user = User.create!(email: "teste#{i}@teste.com", password: "123123",)
  end

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

  5.times do
    Freight.create!(
      carrier: Carrier.all.sample,
      origin: 'Recife',
      destination: 'Manaus' ,
      ready_to_load: DateTime.new(2019, 12, 30),
      type_of_shipment: "FCL",
      container_pack: "20",
      expire_date: DateTime.new(2019, 11, 22),
      price: "500"
    )
  end

Port.create!(name: 'Recife', address: 'Praça Comunidade Luso Brasileira, Recife', latitude: -8.05555555556, longitude: -34.8911111111)
Port.create!(name: 'Manaus', address: 'R. Taqueirinha, Manaus')
Port.create!(name: 'Fortaleza', address: 'Praca Amigos da Marinha, Mucuripe', latitude: -3.71722, longitude:  -38.54306)  
Port.create!(name: 'Rio Grande', address: 'Avenida Honorio Bicalho, Rio Grande')
Port.create!(name: 'Santos', address: 'Av. Guilherme Weinschenck, 16 - Docas, Santos - SP, 11013-260', latitude: -23.9759994293, longitude: -46.2888955111)
Port.create!(name: 'Shangai', address: '358 East Daming Road Shanghai, Shanghai')
Port.create!(name: 'Ningbo', address: 'Yanjiang Dong Road Ningbo, Zhejiang', latitude: 31.219832454, longitude: 121.486998052)
Port.create!(name: 'Guangzhou', address: '531 Gang Qian Lu, Huangpu, Guangzhou, Guangdong', latitude: 23.093865, longitude: 113.437786)
Port.create!(name: 'Busan', address: 'Jungangdong 4(sa)-ga, Busan', latitude: 35.166668, longitude: 129.066666)


puts 'Finished!'



