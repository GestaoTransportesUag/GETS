When("eu clico no link chamado Usuarios") do
  click_link 'Usuarios'
end

When("estou na pagina que lista usuarios") do
  expect(page).to have_content("Usuarios")
end

When("eu clico em Novo Usuario") do
  click_link 'Novo Usuario'
end

When("estou na pagina de adicionar um usuario") do
  expect(page).to have_content("Novo Usuario")
end

When("eu preencho os campos CPF com {string}, nome com {string}, senha {string}, email {string} e telefone {string}") do |cpf, nome, senha, email, telefone|
  fill_in 'usuario[cpf]', :with => cpf
  fill_in 'usuario[nome]', :with => nome
  fill_in 'usuario[senha]', :with => senha
  fill_in 'usuario[email]', :with => email
  fill_in 'usuario[telefone]', :with => telefone
end

When("eu clico em Create Usuario") do
  click_button 'Create Usuario'
end

Then("eu devo ver que o usuario com nome {string} foi adicionado corretamente") do |nome|
  visit '/usuarios'
  expect(page).to have_selector(:link_or_button, nome)
end

When("eu vejo um usuario com nome {string} ja existente") do |nome|
  click_link 'Novo Usuario'
  fill_in 'usuario[cpf]', :with => '70526991410'
  fill_in 'usuario[nome]', :with => nome
  fill_in 'usuario[senha]', :with => '123456'
  fill_in 'usuario[email]', :with => 'arnaldovitorbarros@gmail.com'
  fill_in 'usuario[telefone]', :with => '99836613'
  click_button 'Create Usuario'
  visit '/usuarios'
  expect(page).to have_selector(:link_or_button, nome)
end

Then("eu devo ver que o usuario com nome {string} foi removido corretamente") do |nome|
  expect(page).not_to have_selector(:link_or_button, nome)
end