Feature: Usuario
  As um administrador do sistema do sistema
  I want to adicionar, verificar, atualizar dados e remover usuarios do sistema
  so that eu nao preciso fazer isso manualmente

  Scenario: adicionar corretamente um usuario
    Given eu estou na pagina inicial
    When eu clico no link chamado Usuarios
    And estou na pagina que lista usuarios
    And eu clico em Novo usuario
    And estou na pagina de adicionar um usuario
    And eu preencho os campos CPF com "70526991410", nome com "Arnaldo", senha "123456", email "arnaldovitorbarros@gmail.com" e telefone "99836613"
    And eu clico em Create Usuario
    Then eu devo ver que o usuario com nome "Arnaldo" foi adicionado corretamente

  Scenario: remover corretamente um usuario
    Given eu estou na pagina inicial
    When eu clico no link chamado Usuarios
    And estou na pagina que lista usuarios
    And eu vejo um usuario com nome "Arnaldo" ja existente
    And eu clico no botao remover ao lado do usuario com nome "Arnaldo"
    Then eu devo ver que o usuario com nome "Arnaldo" foi removido corretamente

  Scenario: alterar corretamente as informacoes de um usuario
    Given eu estou na pagina inicial
    When eu clico no link chamado Usuarios
    And estou na pagina que lista usuarios
    And eu vejo um usuario com nome "Arnaldo" ja existente
    And eu clico no botao com o nome "Arnaldo" referente ao usuario
    And eu clico no botao Editar
    And eu preencho os campos CPF com "70526991418", nome com "Alan", senha "123456", email "alantop@gmail.com" e telefone "99836813"
    And eu clico no botao Update Usuario
    Then eu devo ver que o usuario agora tem o CPF "70526991418", nome "Alan", senha "123456", email "alantop@gmail.com" e telefone "99836813"

  Scenario: visualizar as informacoes de um usuario
    Given eu estou na pagina inicial
    When eu clico no link chamado Usuarios
    And estou na pagina que lista usuarios
    And eu vejo um usuario com nome "Arnaldo" ja existente
    And eu clico no botao com o nome "Arnaldo" referente ao usuario
    Then eu devo ver que o usuario com nome "Arnaldo" tem as informacoes corretas

  Scenario: cadastrar um usuario com CPF menor que 11
    Given eu estou na pagina inicial
    When eu clico no link chamado Usuarios
    And estou na pagina que lista usuarios
    And eu clico em Novo usuario
    And estou na pagina de adicionar um usuario
    And eu preencho os campos CPF com "7", nome com "Arnaldo", senha "123456", email "arnaldovitorbarros@gmail.com" e telefone "99836613"
    And eu clico em Create Usuario
    Then eu vejo uma mensagem de erro indicando que o usuario nao pode ser cadastrado