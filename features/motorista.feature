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

  Scenario: alterar corretamente as informacoes de um motorista
    Given eu estou na pagina inicial
    When eu clico no link chamado Motoristas
    And estou na pagina que lista motoristas
    And eu vejo um motorista com nome "Arnaldo" ja existente
    And eu clico no botao com o nome "Arnaldo" referente ao motorista
    And eu clico no botao Editar
    And eu preencho os campos CPF com "70235687110", nome com "Alan", numero de horas com "9" e telefone "88725512"
    And eu clico no botao Update Motorista
    Then eu devo ver que o motorista agora tem o CPF "70235687110", nome "Alan", numero de horas "9" e telefone "88725512"

