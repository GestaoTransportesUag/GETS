When ("eu clico no link chamado Viagens") do
  click_link 'Viagens'
end

When("estou na pagina que lista viagens") do
  expect(page).to have_content("Viagens")
end

When("eu clico em Agendar Viagem") do
  click_link 'Agendar viagem'
end

When("estou na pagina de agendar uma viagem") do
  expect(page).to have_content("Agendar viagem")
end

When("eu preencho os campos de usuario com {string}, veiculo com {string}, motorista com {string}, distancia percorrida com {string}, finalidade com {string}, nome do requisitor com {string}, funcao do requisitor com {string}, cpf do requisitor com {string}, numero de acompanhantes com {string}, data de partida com {string}, data de chegada com {string} e destino com {string}") do |usuario, veiculo, motorista, distancia, finalidade, nome, funcao, cpf, numeroacompanhantes, datapartida, datachegada, destino|
  click_link 'Veiculos'
  click_link 'Novo veículo'
  fill_in 'veiculo[placa]', :with => veiculo
  select "trator", :from => "veiculo[modelo]"
  fill_in 'veiculo[ano]', :with => "2010"
  fill_in 'veiculo[cor]', :with => "verde"
  fill_in 'veiculo[quilometragem]', :with => "10000"
  click_button 'Create Veiculo'

  click_link 'Usuarios'
  click_link 'Novo usuário'
  fill_in 'usuario[cpf]', :with => "11111111111"
  fill_in 'usuario[nome]', :with => usuario
  fill_in 'usuario[senha]', :with => "123456"
  fill_in 'usuario[email]', :with => "exemplo@gmail.com"
  fill_in 'usuario[telefone]', :with => "000000000"
  click_button 'Create Usuario'

  click_link 'Motoristas'
  click_link 'Novo Motorista'
  fill_in 'motorista[cpf]', :with => "11111111112"
  fill_in 'motorista[nome]', :with => motorista
  fill_in 'motorista[telefone]', :with => "111111111"
  click_button 'Create Motorista'

  click_link 'Viagens'
  click_link 'Agendar viagem'
  select usuario
  select veiculo
  select motorista
  fill_in 'viagem[distanciaPercorrida]', :with => distancia
  fill_in 'viagem[finalidade]', :with => finalidade
  fill_in 'viagem[nomeRequisor]', :with => nome
  fill_in 'viagem[funcaoRequisitor]', :with => funcao
  fill_in 'viagem[cpfRequisitor]', :with => cpf
  fill_in 'viagem[numAcompanhantes]', :with => numeroacompanhantes
  fill_in 'viagem[dataPartida]', :with => datapartida
  fill_in 'viagem[dataChegada]', :with => datachegada
  fill_in 'viagem[destino]', :with => destino
end

When("eu clico em Create Viagem") do
  click_button "Create Viagem"
end

Then("eu devo ver que a viagem com destino {string} foi agendada corretamente") do |destino|
  visit '/viagems'
  expect(page).to have_content(destino)
end

When("eu vejo uma viagem com destino {string} ja existente") do |destino|
  click_link 'Veiculos'
  click_link 'Novo veículo'
  fill_in 'veiculo[placa]', :with => "HX576CA"
  select "trator", :from => "veiculo[modelo]"
  fill_in 'veiculo[ano]', :with => "2010"
  fill_in 'veiculo[cor]', :with => "verde"
  fill_in 'veiculo[quilometragem]', :with => "10000"
  click_button 'Create Veiculo'

  click_link 'Usuarios'
  click_link 'Novo usuário'
  fill_in 'usuario[cpf]', :with => "11111111111"
  fill_in 'usuario[nome]', :with => "Teste"
  fill_in 'usuario[senha]', :with => "123456"
  fill_in 'usuario[email]', :with => "exemplo@gmail.com"
  fill_in 'usuario[telefone]', :with => "000000000"
  click_button 'Create Usuario'

  click_link 'Motoristas'
  click_link 'Novo Motorista'
  fill_in 'motorista[cpf]', :with => "11111111112"
  fill_in 'motorista[nome]', :with => "Marta"
  fill_in 'motorista[telefone]', :with => "111111111"
  click_button 'Create Motorista'

  click_link 'Viagens'
  click_link 'Agendar viagem'
  select "Teste"
  select "HX576CA"
  select "Marta"
  fill_in 'viagem[distanciaPercorrida]', :with => "0"
  fill_in 'viagem[finalidade]', :with => "finalidade"
  fill_in 'viagem[nomeRequisor]', :with => "nome"
  fill_in 'viagem[cpfRequisitor]', :with => "11111111111"
  fill_in 'viagem[funcaoRequisitor]', :with => "funcao"
  fill_in 'viagem[numAcompanhantes]', :with => "0"
  fill_in 'viagem[dataPartida]', :with => "31100020190800"
  fill_in 'viagem[dataChegada]', :with => "01110020190800"
  fill_in 'viagem[destino]', :with => destino
  click_button "Create Viagem"

  visit "/viagems"
  expect(page).to have_selector(:link_or_button, destino)
end

When("eu clico no botao Remover ao lado da viagem com destino {string}") do |destino|
  click_on('Desagendar '+destino)
end

Then("eu devo ver que a viagem com destino {string} foi desagendada corretamente") do |destino|
  expect(page).not_to have_selector(:link_or_button, destino)
end

When("eu clico no botao com o nome do destino {string}") do |destino|
  click_link destino
end

When("eu preencho os novos campos de usuario com {string}, veiculo com {string}, motorista com {string}, distancia percorrida com {string}, finalidade com {string}, nome do requisitor com {string}, funcao do requisitor com {string}, cpf do requisitor com {string}, numero de acompanhantes com {string}, data de partida com {string}, data de chegada com {string} e destino com {string}") do |usuario, veiculo, motorista, distancia, finalidade, nome, funcao, cpf, numeroacompanhantes, datapartida, datachegada, destino|
  select usuario
  select veiculo
  select motorista
  fill_in 'viagem[distanciaPercorrida]', :with => distancia
  fill_in 'viagem[finalidade]', :with => finalidade
  fill_in 'viagem[nomeRequisor]', :with => nome
  fill_in 'viagem[funcaoRequisitor]', :with => funcao
  fill_in 'viagem[cpfRequisitor]', :with => cpf
  fill_in 'viagem[numAcompanhantes]', :with => numeroacompanhantes
  fill_in 'viagem[dataPartida]', :with => datapartida
  fill_in 'viagem[dataChegada]', :with => datachegada
  fill_in 'viagem[destino]', :with => destino
end

When("eu clico no botao Update Viagem") do
  click_on('Update Viagem')
end

Then("eu devo ver que o veiculo agora tem usuario {string}, veiculo {string}, motorista {string}, distancia percorrida {string}, finalidade {string}, nome do requisitor {string}, funcao do requisitor {string}, cpf do requisitor {string}, numero de acompanhantes {string}, data de partida {string}, data de chegada {string} e destino {string}") do |usuario, veiculo, motorista, distancia, finalidade, nome, funcao, cpf, numeroacompanhantes, datapartida, datachegada, destino|
  expect(page).to have_content(usuario)
  expect(page).to have_content(veiculo)
  expect(page).to have_content(motorista)
  expect(page).to have_content(distancia)
  expect(page).to have_content(nome)
  expect(page).to have_content(cpf)
  expect(page).to have_content(funcao)
  expect(page).to have_content(numeroacompanhantes)
  expect(page).to have_content(finalidade)
  expect(page).to have_content(datachegada)
  expect(page).to have_content(datapartida)
  expect(page).to have_content(destino)
end

Then("eu devo ver que a viagem com o destino {string} tem as informacoes corretas") do |destino|
  expect(page).to have_content(destino)
  expect(page).to have_content("HX576CA")
  expect(page).to have_content("Marta")
  expect(page).to have_content("Teste")
  expect(page).to have_content("0")
  expect(page).to have_content("nome")
  expect(page).to have_content("11111111111")
  expect(page).to have_content("funcao")
  expect(page).to have_content("0")
  expect(page).to have_content("finalidade")
end

When("eu preencho os campos de usuario com {string}, veiculo com {string},  distancia percorrida com {string}, finalidade com {string}, nome do requisitor com {string}, funcao do requisitor com {string}, cpf do requisitor com {string}, numero de acompanhantes com {string}, data de partida com {string}, data de chegada com {string} e destino com {string}") do |usuario, veiculo, distancia, finalidade, nome, funcao, cpf, numeroacompanhantes, datapartida, datachegada, destino|
  click_link 'Veiculos'
  click_link 'Novo veículo'
  fill_in 'veiculo[placa]', :with => "HX576CA"
  select "trator", :from => "veiculo[modelo]"
  fill_in 'veiculo[ano]', :with => "2010"
  fill_in 'veiculo[cor]', :with => "verde"
  fill_in 'veiculo[quilometragem]', :with => "10000"
  click_button 'Create Veiculo'

  click_link 'Usuarios'
  click_link 'Novo usuário'
  fill_in 'usuario[cpf]', :with => "11111111111"
  fill_in 'usuario[nome]', :with => "Teste"
  fill_in 'usuario[senha]', :with => "123456"
  fill_in 'usuario[email]', :with => "exemplo@gmail.com"
  fill_in 'usuario[telefone]', :with => "000000000"
  click_button 'Create Usuario'

  click_link 'Motoristas'
  click_link 'Novo Motorista'
  fill_in 'motorista[cpf]', :with => "11111111112"
  fill_in 'motorista[nome]', :with => "Marta"
  fill_in 'motorista[telefone]', :with => "111111111"
  click_button 'Create Motorista'

  click_link 'Viagens'
  click_link 'Agendar viagem'

  select usuario
  select veiculo
  fill_in 'viagem[distanciaPercorrida]', :with => distancia
  fill_in 'viagem[finalidade]', :with => finalidade
  fill_in 'viagem[nomeRequisor]', :with => nome
  fill_in 'viagem[cpfRequisitor]', :with => cpf
  fill_in 'viagem[funcaoRequisitor]', :with => funcao
  fill_in 'viagem[numAcompanhantes]', :with => numeroacompanhantes
  fill_in 'viagem[dataPartida]', :with => datapartida
  fill_in 'viagem[dataChegada]', :with => datachegada
  fill_in 'viagem[destino]', :with => destino
end

Then("eu vejo uma mensagem de erro indicando que a viagem nao pode ser agendada") do
  expect(page).to have_content('Motorista must exist')
end