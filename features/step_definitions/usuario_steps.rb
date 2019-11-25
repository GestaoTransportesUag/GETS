When("eu clico no link chamado Usuarios") do
  visit '/usuarios'
end

When("estou na pagina que lista usuarios") do
  expect(page).to have_content("Usuários")
end

When("eu clico em CADASTRAR") do
  click_link 'CADASTRAR'
end

When("estou na pagina de adicionar um usuario") do
  expect(page).to have_content("Cadastrar usuário")
end

When("eu preencho os campos CPF com {string}, nome com {string}, senha {string}, email {string}, telefone {string} e ativo" ) do |cpf, nome, senha, email, telefone|
  fill_in 'usuario[cpf]', :with => cpf
  fill_in 'usuario[nome]', :with => nome
  fill_in 'usuario[senha]', :with => senha
  fill_in 'usuario[email]', :with => email
  fill_in 'usuario[telefone]', :with => telefone
  check ('usuario[ativo]')


end

When("eu clico em Create Usuario") do
  click_button 'Create Usuario'
end


Then("eu devo ver que o consigo acessar o sistema com e email {string} e senha {string}") do |email, senha|
  click_on 'ENTRAR'
  fill_in 'email', :with => email
  fill_in 'password', :with => senha
  click_on 'Login'
  expect(page).to have_content("Logado")

end

When("eu vejo um usuario com nome {string} ja existente") do |nome|
  visit '/usuarios'
  expect(page).to have_content("Usuários")
  click_link 'Novo usuário'
  fill_in 'usuario[cpf]', :with => '11111111111'
  fill_in 'usuario[nome]', :with => nome
  fill_in 'usuario[senha]', :with => '123456'
  fill_in 'usuario[email]', :with => 'teste@gmail.com'
  fill_in 'usuario[telefone]', :with => '99836613'
  check('usuario[ativo]')
  click_button 'Create Usuario'
  visit '/usuarios'
  expect(page).to have_selector(:link_or_button, nome)
end

When("eu clico no botao remover ao lado do usuario com nome {string}") do |nome|
  expect(page).to have_selector(:link_or_button, nome)
  click_link ('Remover '+nome)
end

Then("eu devo ver que o usuario com nome {string} esta inativo") do |nome|
  click_on nome
  expect(page).to have_content("Ativo: false")
end

When("eu clico no botao com o nome {string} referente ao usuario") do |nome|
  visit '/usuarios'
end

When("eu clico no botao editar do usuario {string}") do |nome|
  click_on nome
  click_on 'Editar'
end

When("eu preencho o campo nome com {string}") do |nome|
  fill_in 'usuario[nome]', :with => nome
end

When("eu clico no botao Update Usuario") do
  click_button 'Update Usuario'
end

Then("eu devo ver que o usuario agora tem o nome {string}") do |nome|
  expect(page).to have_content(nome)
end

Then("eu devo ver que o usuario com nome {string} tem as informacoes corretas") do |nome|
  click_on nome
  expect(page).to have_content(nome)
  expect(page).to have_content('11111111111')
  expect(page).to have_content('123456')
  expect(page).to have_content('99836613')
  expect(page).to have_content('teste@gmail.com')
end

Then("eu vejo uma mensagem de erro indicando que o usuario nao pode ser cadastrado") do
  expect(page).to have_content('Cpf is the wrong length')
end

When("eu clico em Novo usuario") do
  click_on 'Novo usuário'
end