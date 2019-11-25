Feature: Motorista
  As um administrador do sistema de gerencia do setor de veiculos
  I want to adicionar, verificar, atualizar dados e remover motoristas do sistema
  So that eu nao preciso fazer isso manualmente

  Scenario: adicionar corretamente um motorista
    adicionar corretamente um usuario
    When eu clico no link chamado Motoristas
    And estou na pagina que lista motoristas
    And eu clico em Novo Motorista
    And estou na pagina de adicionar um motorista
    And eu preencho os campos CPF com "22222222222", nome com "Marta", telefone "99836613" e ativo
    And eu clico em Create Motorista
    Then eu devo ver que o motorista com nome "Marta" foi adicionado corretamente

  Scenario: remover corretamente um motorista
    adicionar corretamente um motorista
    And eu vejo um motorista com nome "Marinho" ja existente
    And eu clico no botao remover motorista "Marinho"
    Then eu devo ver que o motorista com nome "Marinho" esta inativo

  Scenario: alterar corretamente as informacoes de um motorista
    adicionar corretamente um motorista
    And eu vejo um motorista com nome "Dudu" ja existente
    And eu clico no botao com o nome "Dudu" referente ao motorista
    And eu clico no botao Editar
    And eu preencho os campos CPF com "11111111111", nome com "Alan", telefone "99836613" e ativo
    And eu clico no botao Update Motorista
    Then eu devo ver que o motorista agora tem o CPF "11111111111", nome "Alan" e telefone "99836613"

  Scenario: visualizar as informacoes de um motorista
    adicionar corretamente um motorista
    And eu vejo um motorista com nome "Dudu" ja existente
    And eu clico no botao com o nome "Dudu" referente ao motorista
    Then eu devo ver que o motorista com nome "Dudu" tem as informacoes corretas

   Scenario: cadastrar um motorista com CPF menor que 11
     adicionar corretamente um usuario
     When eu clico no link chamado Motoristas
     And estou na pagina que lista motoristas
     And eu clico em Novo Motorista
     And estou na pagina de adicionar um motorista
     And eu preencho os campos CPF com "7", nome com "Arnaldo", telefone "99836613" e ativo
     And eu clico em Create Motorista
     Then eu vejo uma mensagem de erro indicando que o motorista nao pode ser cadastrado