Feature: Veiculo
  As um administrador do sistema de gerencia do setor de veiculos
  I want to adicionar, atualizar dados, verificar informacoes e remover veiculos da frota
  so that eu nao preciso fazer isso manualmente

  Scenario: adicionar corretamente um veiculo
    Given eu estou na pagina inicial
    When eu clico no link chamado Veiculos
    And estou na pagina que lista veiculos
    And eu clico em Novo veiculo
    And estou na pagina de adicionar um veiculo
    And eu preencho os campos de placa com "HX576CA", modelo com "hatch", ano com "1998", cor com "Vermelho" e quilometragem com "10000"
    And eu clico em Create Veiculo
    Then eu devo ver que o veiculo com placa "HX576CA" foi adicionado corretamente

  Scenario: remover corretamente um veiculo
    Given eu estou na pagina inicial
    When eu clico no link chamado Veiculos
    And estou na pagina que lista veiculos
    And eu vejo um veiculo com placa "HX576CA" ja existente
    And eu clico no botao Remover
    Then eu devo ver que o veiculo com a placa "HX576CA" foi removido corretamente

  Scenario: alterar corretamente as informacoes de um veiculo
    Given eu estou na pagina inicial
    When eu clico no link chamado Veiculos
    And estou na pagina que lista veiculos
    And eu vejo um veiculo com placa "HX576CA" ja existente
    And eu clico no botao com o nome da placa "HX576CA"
    And eu clico no botao Editar
    And eu preencho os campos de placa com "CA69ABV", modelo com "ônibus", ano com "2002", cor com "Azul" e quilometragem com "30"
    And eu clico no botao Update Veiculo
    Then eu devo ver que o veiculo agora tem a placa "CA69ABV", modelo "ônibus", ano "2002", cor "Azul" e quilometragem "30"

  Scenario: visualizar as informacoes de um veiculo
    Given eu estou na pagina inicial
    When eu clico no link chamado Veiculos
    And estou na pagina que lista veiculos
    And eu vejo um veiculo com placa "RCA4567" ja existente
    And eu clico no botao com o nome da placa "RCA4567"
    Then eu devo ver que o veiculo com a placa "RCA4567" tem as informacoes corretas

  Scenario: adicionar um veiculo com tamanho da placa menor que 7
    Given eu estou na pagina inicial
    When eu clico no link chamado Veiculos
    And estou na pagina que lista veiculos
    And eu clico em Novo veiculo
    And estou na pagina de adicionar um veiculo
    And eu preencho os campos de placa com "A", modelo com "ônibus", ano com "1998", cor com "Rosa" e quilometragem com "3000"
    And eu clico em Create Veiculo
    Then eu vejo uma mensagem de erro indicando que o veiculo nao pode ser cadastrado