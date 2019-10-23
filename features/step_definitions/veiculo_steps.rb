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
