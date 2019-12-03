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

Port.create!(name: 'Recife', address: 'Praça Comunidade Luso Brasileira no 70 Bairro do Recife - Recife, PE 50030-280, Brazil')
Port.create!(name: 'Manaus', address: 'R. Taqueirinha, 25 - Centro, Manaus - AM, 69005-420')
Port.create!(name: 'Fortaleza', address: 'Av. Vicente de Castro - Cais do Porto, Fortaleza - CE, 60180-410')
Port.create!(name: 'Rio Grande', address: 'Hondrio Bicalho Ave, W/N - Mailbox 198 - Rio Grande, RS 96201-020 - Brazil')
Port.create!(name: 'Santos', address: 'Av. Conselheiro Rodrigues Alves, S/N, Santos - SP, 11015-900')
Port.create!(name: 'Itajaí', address: 'Av. Eng.º Leite Ribeiro, 782, Caixa Postal 71')
Port.create!(name: 'São Francisco do Sul', address: 'SCPAR Porto de São Francisco do Sul - Rua Engenheiro Leite Ribeiro - Centro, São Francisco do Sul - SC')
Port.create!(name: 'Tianjin', address: 'Tianjin Port, Binhai, China')
Port.create!(name: 'Shangai', address: '825 Gangjian Rd, Pudong, Shanghai, China')
Port.create!(name: 'Ningbo', address: 'Yanjiang E Rd, Zhenhai, Ningbo, Zhejiang, China')
Port.create!(name: 'Guangzhou', address: 'Guangzhou New Port, Huandao Road, Haizhu, Cantão, Guangdong, China')
Port.create!(name: 'Singapore', address: '460 Alexandra Road #19-00 PSA Building Singapore 119963 Singapore')
Port.create!(name: 'Rotterdam', address: '3198 LK Europoort Rotterdam, Países Baixos')
Port.create!(name: 'Quingdao', address: 'Qingdao Port, Shibei, Qingdao, China')
Port.create!(name: 'Dalian', address: 'Port of Dalian, Shugang Rd, Zhongshan, Dalian, Liaoning, China')
Port.create!(name: 'Busan', address: '79-9, Jungan-Dong 4GA Jung-Gu Busan 600-016 Korea, South')
Port.create!(name: 'Miami', address: 'Port of Miami, Miami, Flórida, EUA')

puts 'Finished!'
