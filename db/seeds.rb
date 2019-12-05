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

Port.create!(name: 'Recife', address: 'Praça Comunidade Luso Brasileira, Recife', latitude: -8.05555555556, longitude: -34.8911111111 )
Port.create!(name: 'Manaus', address: 'R. Taqueirinha, 25 - Centro, Manaus - AM, 69005-420', latitude: -3.143056 , longitude: -60.016944)
Port.create!(name: 'Fortaleza', address: 'Av. Vicente de Castro - Cais do Porto, Fortaleza - CE, 60180-410', latitude: -3.71722, longitude: -38.54306)
Port.create!(name: 'Rio Grande', address: 'Honorio Bicalho, Rio Grande')
Port.create!(name: 'Santos', address: 'Av. Conselheiro Rodrigues Alves, Santos - SP, 11015-900', latitude: -23.944841, longitude: -46.330376)
Port.create!(name: 'Itajaí', address: 'Av. Eng Leite Ribeiro, 782', latitude: -26.900, longitude: -48.667)
# Port.create!(name: 'São Francisco do Sul', address: 'SCPAR Porto de São Francisco do Sul - Rua Engenheiro Leite Ribeiro - Centro, São Francisco do Sul - SC', latitude: , longitude:)
Port.create!(name: 'Tianjin', address: 'Tianjin Port, Binhai, China', latitude: 38.972662776, longitude: 117.784496862)
Port.create!(name: 'Shangai', address: '825 Gangjian Rd, Pudong, Shanghai, China', latitude: 31.219832454, longitude: 121.486998052)
Port.create!(name: 'Ningbo', address: 'Yanjiang E Rd, Zhenhai, Ningbo, Zhejiang, China', latitude: 29.8666632, longitude: 121.5499978)
Port.create!(name: 'Guangzhou', address: 'Guangzhou New Port, Huandao Road, Haizhu, Cantão, Guangdong, China', latitude: 23.093865, longitude: 113.437786)
Port.create!(name: 'Singapore', address: '460 Alexandra Road #19-00 PSA Building Singapore 119963 Singapore', latitude: 1.264, longitude: 103.84)
# Port.create!(name: 'Rotterdam', address: '3198 LK Europoort Rotterdam, Países Baixos')
# Port.create!(name: 'Quingdao', address: 'Qingdao Port, Shibei, Qingdao, China', latitude: , longitude:)
# Port.create!(name: 'Dalian', address: 'Port of Dalian, Shugang Rd, Zhongshan, Dalian, Liaoning, China', latitude: , longitude:)
# Port.create!(name: 'Busan', address: '79-9, Jungan-Dong 4GA Jung-Gu Busan 600-016 Korea, South', latitude: , longitude:)
# Port.create!(name: 'Miami', address: 'Port of Miami, Miami, Flórida, EUA')

puts 'Finished!'



