Feature: Usuario
  As um administrador do sistema do sistema
  I want to adicionar, verificar, atualizar dados e remover usuarios do sistema
  so that eu nao preciso fazer isso manualmente

  Scenario: adicionar corretamente um usuario
    Given eu estou na pagina inicial
    When eu clico no link chamado Usuarios
    And estou na pagina que lista usuarios
    And eu clico em Novo Usuario
    And estou na pagina de adicionar um usuario
    And eu preencho os campos CPF com "70526991410", nome com "Arnaldo", senha "123456789", email "arnaldovitorbarros@gmail.com" e telefone "99836613"
    And eu clico em Create Usuario
    Then eu devo ver que o usuario com nome "Arnaldo" foi adicionado corretamente