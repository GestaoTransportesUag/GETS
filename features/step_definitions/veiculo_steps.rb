Given("eu estou na pagina inicial") do
  visit '/'
end

When("eu clico no link chamado Veiculos") do
  visit '/veiculos'
end

When("estou na pagina que lista veiculos") do
  expect(page).to have_content("Veículos")
end

When("eu clico em Novo veiculo") do
  click_link 'Novo veículo'
end

When("estou na pagina de adicionar um veiculo") do
  expect(page).to have_content("Cadastrar veículo")
end

When("eu preencho os campos de placa com {string}, modelo com {string}, ano com {string}, cor com {string}, quilometragem com {string} e ativo") do |placa, modelo, ano, cor, quilometragem|
  fill_in 'veiculo[placa]', :with => placa
  select modelo, :from => "veiculo[modelo]"
  fill_in 'veiculo[ano]', :with => ano
  fill_in 'veiculo[cor]', :with => cor
  fill_in 'veiculo[quilometragem]', :with => quilometragem
  check('veiculo[ativo]')
end

When("eu clico em Create Veiculo") do
  click_button 'Create Veiculo'
end

When("eu devo ver que o veiculo com placa {string} foi adicionado corretamente") do |placa|
  visit '/veiculos'
  expect(page).to have_selector(:link_or_button, placa)
end

When("eu vejo um veiculo com placa {string} ja existente") do |placa|
  visit '/veiculos'
  click_link 'Novo veículo'
  fill_in 'veiculo[placa]', :with => placa
  select "caminhonete", :from => "veiculo[modelo]"
  fill_in 'veiculo[ano]', :with => "2010"
  fill_in 'veiculo[cor]', :with => "vermelho"
  fill_in 'veiculo[quilometragem]', :with => "100000"
  check('veiculo[ativo]')
  click_button 'Create Veiculo'
  visit '/veiculos'
  expect(page).to have_selector(:link_or_button, placa)
end

When("eu clico no botao Remover ao lado do veiculo com placa {string}") do |placa|
  click_on('Remover '+placa)
end

Then("eu devo ver que o veiculo com a placa {string} foi removido corretamente") do |placa|
  click_on(placa)
  expect(page).to have_content("Ativo: false")
end

When("eu clico no botao com o nome da placa {string}") do |placa|
  click_link placa
end

When("eu clico no botao Update Veiculo") do
  click_button 'Update Veiculo'
end

Then("eu devo ver que o veiculo agora tem a placa {string}, modelo {string}, ano {string}, cor {string} e quilometragem {string}") do |placa, modelo, ano, cor, quilometragem|
  expect(page).to have_content(placa)
  expect(page).to have_content(modelo)
  expect(page).to have_content(ano)
  expect(page).to have_content(cor)
  expect(page).to have_content(quilometragem)
end

When("eu clico no botao Editar") do
  click_on 'Editar'
end

Then("eu devo ver que o veiculo com a placa {string} tem as informacoes corretas") do |placa|
  expect(page).to have_content(placa)
  expect(page).to have_content('caminhonete')
  expect(page).to have_content('2010')
  expect(page).to have_content('vermelho')
  expect(page).to have_content('100000')
end

Then("eu vejo uma mensagem de erro indicando que o veiculo nao pode ser cadastrado") do
  expect(page).to have_content('Placa is the wrong length')
end