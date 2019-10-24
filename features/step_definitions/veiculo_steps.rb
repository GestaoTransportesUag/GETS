Given("eu estou na pagina inicial") do
  visit '/'
end

When("eu clico no link chamado Veiculos") do
  click_link 'Veiculos'
end

When("estou na pagina que lista veiculos") do
  expect(page).to have_content("Veiculos")
end

When("eu clico em Novo Veiculo") do
  click_link 'Novo Veiculo'
end

When("estou na pagina de adicionar um veiculo") do
  expect(page).to have_content("Novo Veiculo")
end

When("eu preencho os campos de placa com {string}, modelo com {string}, ano com {string}, cor com {string} e quilometragem com {string}") do |placa, modelo, ano, cor, quilometragem|
  fill_in 'veiculo[placa]', :with => placa
  fill_in 'veiculo[modelo]', :with => modelo
  fill_in 'veiculo[ano]', :with => ano
  fill_in 'veiculo[cor]', :with => cor
  fill_in 'veiculo[quilometragem]', :with => quilometragem
end

When("eu clico em Create Veiculo") do
  click_button 'Create Veiculo'
end

When("eu devo ver que o veiculo com placa {string} foi adicionado corretamente") do |placa|
  visit '/veiculos'
  expect(page).to have_selector(:link_or_button, placa)
end

When("eu vejo um veiculo com placa {string} ja existente") do |placa|
  click_link 'Novo Veiculo'
  fill_in 'veiculo[placa]', :with => placa
  fill_in 'veiculo[modelo]', :with => 'caminhonete'
  fill_in 'veiculo[ano]', :with => '1198'
  fill_in 'veiculo[cor]', :with => 'azul'
  fill_in 'veiculo[quilometragem]', :with => '1000'
  click_button 'Create Veiculo'
  visit '/veiculos'
  expect(page).to have_selector(:link_or_button, placa)
end

When("eu clico no botao Remover") do
  click_link 'Remover'
end

Then("eu devo ver que o veiculo com a placa {string} foi removido corretamente") do |placa|
  expect(page).not_to have_selector(:link_or_button, placa)
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
  click_link 'Editar'
end

Then("eu devo ver que o veiculo com a placa {string} tem as informacoes corretas") do |placa|
  expect(page).to have_content(placa)
  expect(page).to have_content('caminhonete')
  expect(page).to have_content('1198')
  expect(page).to have_content('azul')
  expect(page).to have_content('1000')
end

Then("eu vejo uma mensagem de erro indicando que o veiculo nao pode ser cadastrado") do
  expect(page).to have_content('Placa is the wrong length')
end