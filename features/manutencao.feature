Feature: Veiculo
  As um administrador do sistema de gerencia do setor de veiculos
  I want to agendar, atualizar dados, verificar informacoes e desagendar manutencoes
  so that eu nao preciso fazer isso manualmente

  Scenario: agendar corretamente uma manutencao
    Given eu estou na pagina inicial
    When eu clico no link chamado Manutencoes
    And estou na pagina que lista manutencoes
    And eu clico em Agendar Manutencao
    And estou na pagina de agendar uma manutencao
    And eu preencho os campos de usuario com "Teste", veiculo com "HX576CA", descricao com "trocar pneus", custo com "0", realizado em com "Pneu dourado" e realizado quando com "01/11/2019"
    And eu clico em Create Manutencao
    Then eu devo ver que a manutencao com data "2019-11-01" foi agendada corretamente

  Scenario: desagendar corretamente uma manutencao
    Given eu estou na pagina inicial
    When eu clico no link chamado Manutencoes
    And estou na pagina que lista manutencoes
    And eu vejo uma manutencao com data "2019-11-01" ja existente
    And eu clico no botao Remover
    Then eu devo ver que a viagem com data "2019-11-01" foi desagendada corretamente

  Scenario: alterar corretamente as informacoes de uma manutencao
    Given eu estou na pagina inicial
    When eu clico no link chamado Manutencoes
    And estou na pagina que lista manutencoes
    And eu vejo uma manutencao com data "2019-11-01" ja existente
    And eu clico no botao com o nome "2019-11-01"
    And eu clico no botao Editar
    And eu preencho os campos de usuario com "Teste", veiculo com "HX576CA", descricao com "trocar pneus", custo com "150", realizado em com "Pneu dourado" e realizado quando com "01/11/2019"
    And eu clico no botao Update Veiculo
    Then eu devo ver que o veiculo agora tem usuario tem "Teste", veiculo tem "HX576CA", descricao tem "trocar pneus", custo tem "150", realizado em tem "Pneu dourado" e realizado quando tem "01/11/2019"

  Scenario: visualizar as informacoes de uma manutencao
    Given eu estou na pagina inicial
    When eu clico no link chamado Manutencoes
    And estou na pagina que lista manutencoes
    And eu vejo uma manutencao com data "2019-11-01" ja existente
    And eu clico no botao com o nome "2019-11-01"
    Then eu devo ver que a manutencao com a data "2019-11-01" tem as informacoes corretas

  Scenario: agendar uma manutencao sem veiculo
    Given eu estou na pagina inicial
    When eu clico no link chamado Manutencoes
    And estou na pagina que lista manutencoes
    And eu clico em Agendar Manutencao
    And estou na pagina de agendar uma manutencao
    And eu preencho os campos de usuario com "Teste", descricao com "trocar pneus", custo com "150", realizado em com "Pneu dourado" e realizado quando com "01/11/2019"
    And eu clico em Create Manutencao
    Then eu vejo uma mensagem de erro indicando que a manutencao nao pode ser agendada