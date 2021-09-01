

origem = ['R. Inhambu, 240 - Vila Uberabinha, São Paulo - SP, 04520-010'],['Rua Djalma Forjaz, 93 - 10 - Capivari, Campos do Jordão - SP, 12460-000'],['Rua Jericó 193 - cj. 72 - Vila Madalena, São Paulo - SP, 05435-040'],['Av. Brg. Faria Lima, 2170 - Putim, São José dos Campos - SP, 12227-901'],['Av. Dona Ana Costa, 465 - Gonzaga, Santos - SP, 11060-003']

user = User.new
user = User.new(email: "a@a.com")
  user.password = '123456'
  user.encrypted_password = '123456'
user.save

destino = ['R. Salvador Correa, 365 - Centro, Ubatuba - SP, 11680-000']
origem.each do |origem|

 viagem = Viagem.new(
    origem: origem,
    destino: destino
  )
  viagem.user = user
  viagem.save!
end


puts 'Finished!'
