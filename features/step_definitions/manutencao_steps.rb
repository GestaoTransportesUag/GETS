When("eu clico no link chamado Manutencoes") do
  click_link "Manutenções"
end

When("estou na pagina que lista manutencoes") do
  expect(page).to have_content("Manutenções")
end

When("eu clico em Agendar Manutencao") do
  click_link 'Agendar manutenção'
end

When("estou na pagina de agendar uma manutencao") do
  expect(page).to have_content("Agendar manutenção")
end

When("eu preencho os campos de usuario com {string}, veiculo com {string}, descricao com {string}, custo com {string}, realizado em com {string} e realizado quando com {string}") do |usuario, veiculo, descricao, custo, realizado, data|
  click_link 'Usuarios'
  click_link 'Novo usuário'
  fill_in 'usuario[cpf]', :with => "11111111111"
  fill_in 'usuario[nome]', :with => usuario
  fill_in 'usuario[senha]', :with => "123456"
  fill_in 'usuario[email]', :with => "exemplo@gmail.com"
  fill_in 'usuario[telefone]', :with => "100000000"
  click_button 'Create Usuario'

  click_link 'Veiculos'
  click_link 'Novo veículo'
  fill_in 'veiculo[placa]', :with => veiculo
  select "trator", :from => "veiculo[modelo]"
  fill_in 'veiculo[ano]', :with => "2010"
  fill_in 'veiculo[cor]', :with => "verde"
  fill_in 'veiculo[quilometragem]', :with => "10000"
  click_button 'Create Veiculo'

  click_link 'Manutenções'
  click_link 'Agendar manutenção'
  select usuario
  select veiculo
  fill_in 'manutencao[descricao]', :with => descricao
  fill_in 'manutencao[custo]', :with => custo
  fill_in 'manutencao[realizadoEm]', :with => realizado
  fill_in 'manutencao[realizadoQuando]', :with => data
end

When("eu clico em Create Manutencao") do
  click_on('Create Manutencao')
end

Then("eu devo ver que a manutencao com descricao {string} foi agendada corretamente") do |descricao|
  visit "/manutencaos"
  expect(page).to have_selector(:link_or_button, descricao)
end

When("eu vejo uma manutencao com descricao {string} ja existente") do |descricao|
  click_link 'Usuarios'
  click_link 'Novo usuário'
  fill_in 'usuario[cpf]', :with => "11111111111"
  fill_in 'usuario[nome]', :with => "Teste"
  fill_in 'usuario[senha]', :with => "123456"
  fill_in 'usuario[email]', :with => "exemplo@gmail.com"
  fill_in 'usuario[telefone]', :with => "100000000"
  click_button 'Create Usuario'

  click_link 'Veiculos'
  click_link 'Novo veículo'
  fill_in 'veiculo[placa]', :with => "aaa1111"
  select "trator", :from => "veiculo[modelo]"
  fill_in 'veiculo[ano]', :with => "2010"
  fill_in 'veiculo[cor]', :with => "verde"
  fill_in 'veiculo[quilometragem]', :with => "10000"
  click_button 'Create Veiculo'

  click_link 'Manutenções'
  click_link 'Agendar manutenção'
  select "Teste"
  select "aaa1111"
  fill_in 'manutencao[descricao]', :with => descricao
  fill_in 'manutencao[custo]', :with => "0"
  fill_in 'manutencao[realizadoEm]', :with => "pneu dourado"
  fill_in 'manutencao[realizadoQuando]', :with => "01/11/2019"
  click_button 'Create Manutencao'

  visit "/manutencaos"
  expect(page).to have_selector(:link_or_button, descricao)
end

When("eu clico no botao Remover ao lado da manutencao com descriao {string}") do |descricao|
  click_on('Desagendar '+descricao)
end

Then("eu devo ver que a manutencao com descricao {string} foi desagendada corretamente") do |descricao|
  expect(page).not_to have_selector(:link_or_button, descricao)
end

When("eu clico no botao com o nome {string}") do |descricao|
  click_link descricao
end

When("eu preencho os novos campos de usuario com {string}, veiculo com {string}, descricao com {string}, custo com {string}, realizado em com {string} e realizado quando com {string}") do |usuario, veiculo, descricao, custo, realizado, data|
  select usuario
  select veiculo
  fill_in 'manutencao[descricao]', :with => descricao
  fill_in 'manutencao[custo]', :with => custo
  fill_in 'manutencao[realizadoEm]', :with => realizado
  fill_in 'manutencao[realizadoQuando]', :with => data
end

When("eu clico no botao Update Manutencao") do
  click_on("Update Manutencao")
end

Then("eu devo ver que o veiculo agora tem usuario tem {string}, veiculo tem {string}, descricao tem {string}, custo tem {string}, realizado em tem {string} e realizado quando tem {string}") do |usuario, veiculo, descicao, custo, realizado, data|
  expect(page).to have_content(usuario)
  expect(page).to have_content(veiculo)
  expect(page).to have_content(descicao)
  expect(page).to have_content(custo)
  expect(page).to have_content(realizado)
end

Then("eu devo ver que a manutencao com a descricao {string} tem as informacoes corretas") do |descricao|
  expect(page).to have_content("Teste")
  expect(page).to have_content("aaa1111")
  expect(page).to have_content(descricao)
  expect(page).to have_content("0")
  expect(page).to have_content("pneu dourado")
  expect(page).to have_content("2019-11-01")
end

When("eu preencho os campos de usuario com {string}, descricao com {string}, custo com {string}, realizado em com {string} e realizado quando com {string}") do |usuario, descricao, custo, realizado, data|
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
  fill_in 'usuario[nome]', :with => usuario
  fill_in 'usuario[senha]', :with => "123456"
  fill_in 'usuario[email]', :with => "exemplo@gmail.com"
  fill_in 'usuario[telefone]', :with => "000000000"
  click_button 'Create Usuario'

  click_link 'Manutenções'
  click_link 'Agendar manutenção'
  select usuario
  fill_in 'manutencao[descricao]', :with => descricao
  fill_in 'manutencao[custo]', :with => custo
  fill_in 'manutencao[realizadoEm]', :with => realizado
  fill_in 'manutencao[realizadoQuando]', :with => data
end

Then("eu vejo uma mensagem de erro indicando que a manutencao nao pode ser agendada") do
  expect(page).to have_content('Veiculo must exist')
end