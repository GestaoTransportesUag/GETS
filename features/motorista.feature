Feature: Motorista
  As um administrador do sistema de gerencia do setor de veiculos
  I want to adicionar, verificar, atualizar dados e remover motoristas do sistema
  So that eu nao preciso fazer isso manualmente

  Scenario: adicionar corretamente um motorista
    Given eu estou na pagina inicial
    When eu clico no link chamado Motoristas
    And estou na pagina que lista motoristas
    And eu clico em Novo Motorista
    And estou na pagina de adicionar um motorista
    And eu preencho os campos CPF com "70526991410", nome com "Arnaldo", numero de horas com "0" e telefone "99836613"
    And eu clico em Create Motorista
    Then eu devo ver que o motorista com nome "Arnaldo" foi adicionado corretamente

  Scenario: remover corretamente um motorista
    Given eu estou na pagina inicial
    When eu clico no link chamado Motoristas
    And estou na pagina que lista motoristas
    And eu vejo um motorista com nome "Arnaldo" ja existente
    And eu clico no botao Remover
    Then eu devo ver que o motorista com nome "Arnaldo" foi removido corretamente
