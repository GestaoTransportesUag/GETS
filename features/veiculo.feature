Feature: Veiculo
  As um administrador do sistema de gerencia do setor de veiculos
  I want to adicionar, atualizar dados, verificar informacoes e remover veiculos da frota
  so that eu nao preciso fazer isso manualmente

  Scenario: adicionar corretamente um veiculo
    adicionar corretamente um usuario
    When eu clico no link chamado Veiculos
    And estou na pagina que lista veiculos
    And eu clico em Novo veiculo
    And estou na pagina de adicionar um veiculo
    And eu preencho os campos de placa com "HX576CA", modelo com "passeio", ano com "1998", cor com "Vermelho", quilometragem com "10000" e ativo
    And eu clico em Create Veiculo
    Then eu devo ver que o veiculo com placa "HX576CA" foi adicionado corretamente

  Scenario: remover corretamente um veiculo
    adicionar corretamente um veiculo
    And eu vejo um veiculo com placa "HHH7777" ja existente
    And eu clico no botao Remover ao lado do veiculo com placa "HHH7777"
    Then eu devo ver que o veiculo com a placa "HHH7777" foi removido corretamente

  Scenario: alterar corretamente as informacoes de um veiculo
    adicionar corretamente um veiculo
    And eu vejo um veiculo com placa "HHH7777" ja existente
    And eu clico no botao com o nome da placa "HHH7777"
    And eu clico no botao Editar
    And eu preencho os campos de placa com "CA69ABV", modelo com "ônibus", ano com "2002", cor com "Azul", quilometragem com "30" e ativo
    And eu clico no botao Update Veiculo
    Then eu devo ver que o veiculo agora tem a placa "CA69ABV", modelo "ônibus", ano "2002", cor "Azul" e quilometragem "30"

  Scenario: visualizar as informacoes de um veiculo
    adicionar corretamente um veiculo
    And eu vejo um veiculo com placa "HHH7777" ja existente
    And eu clico no botao com o nome da placa "HHH7777"
    Then eu devo ver que o veiculo com a placa "HHH7777" tem as informacoes corretas

  Scenario: adicionar um veiculo com tamanho da placa menor que 7
    adicionar corretamente um usuario
    When eu clico no link chamado Veiculos
    And estou na pagina que lista veiculos
    And eu clico em Novo veiculo
    And estou na pagina de adicionar um veiculo
    And eu preencho os campos de placa com "A", modelo com "ônibus", ano com "1998", cor com "Rosa", quilometragem com "3000" e ativo
    And eu clico em Create Veiculo
    Then eu vejo uma mensagem de erro indicando que o veiculo nao pode ser cadastrado