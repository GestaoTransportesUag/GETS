When("eu clico no link chamado Motoristas") do
  visit '/motorista'
end

When("estou na pagina que lista motoristas") do
  expect(page).to have_content("Motoristas")
end

When("eu clico em Novo Motorista") do
  click_link 'Novo Motorista'
end

When("estou na pagina de adicionar um motorista") do
  expect(page).to have_content("Cadastrar motorista")
end

When("eu preencho os campos CPF com {string}, nome com {string}, telefone {string} e ativo") do |cpf, nome, telefone|
  fill_in 'motorista[cpf]', :with => cpf
  fill_in 'motorista[nome]', :with => nome
  fill_in 'motorista[telefone]', :with => telefone
  check('motorista[ativo]')
end

When("eu clico em Create Motorista") do
  click_button 'Create Motorista'
end

When("eu vejo um motorista com cpf {string} ja existente") do |cpf|
  visit '/motorista'
  expect(page).to have_content("Motoristas")
  click_link 'Novo Motorista'
  fill_in 'motorista[cpf]', :with => cpf
  fill_in 'motorista[nome]', :with => "Marinho"
  fill_in 'motorista[telefone]', :with => "999999999"
  check('motorista[ativo]')
  click_button 'Create Motorista'
  visit '/motorista'
  expect(page).to have_selector(:link_or_button, cpf)
end

When("eu clico no botao remover motorista {string}") do |nome|
  visit '/motorista'
  click_on 'Remover '+nome
end

Then("eu devo ver que o motorista com cpf {string} foi adicionado corretamente") do |nome|
  visit '/motorista'
  expect(page).to have_selector(:link_or_button, nome)
end

When("eu vejo um motorista com nome {string} ja existente") do |nome|
  visit '/motorista'
  expect(page).to have_content("Motoristas")
  click_link 'Novo Motorista'
  fill_in 'motorista[cpf]', :with => '11111111111'
  fill_in 'motorista[nome]', :with => nome
  fill_in 'motorista[telefone]', :with => '99836613'
  check('motorista[ativo]')
  click_button 'Create Motorista'
  visit '/motorista'
  expect(page).to have_selector(:link_or_button, nome)
end

Then("eu devo ver que o motorista com nome {string} esta inativo") do |nome|
  click_on nome
  expect(page).to have_content("Ativo: false")
end

When("eu clico no botao com o nome {string} referente ao motorista") do |nome|
  click_link nome
end

When("eu clico no botao Update Motorista") do
  click_button 'Update Motorista'
end

Then("eu devo ver que o motorista agora tem o CPF {string}, nome {string} e telefone {string}") do |cpf, nome, telefone|
  expect(page).to have_content(cpf)
  expect(page).to have_content(nome)
  expect(page).to have_content(telefone)
end

Then("eu devo ver que o motorista com nome {string} tem as informacoes corretas") do |nome|
  expect(page).to have_content(nome)
  expect(page).to have_content('11111111111')
  expect(page).to have_content('99836613')
end

Then("eu vejo uma mensagem de erro indicando que o motorista nao pode ser cadastrado") do
  expect(page).to have_content('Cpf is the wrong length')
end

