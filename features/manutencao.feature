Feature: Veiculo
  As um administrador do sistema de gerencia do setor de veiculos
  I want to agendar, atualizar dados, verificar informacoes e desagendar manutencoes
  so that eu nao preciso fazer isso manualmente

  Scenario: agendar corretamente uma manutencao
    adicionar corretamente um usuario
    adicionar corretamente um veiculo
    When eu clico no link chamado Manutencoes
    And estou na pagina que lista manutencoes
    And eu clico em Agendar Manutencao
    And estou na pagina de agendar uma manutencao
    And eu preencho os campos de usuario com "Teste", veiculo com "HX576CA", descricao com "trocar pneus", custo com "3", realizado em com "Pneu dourado" e realizado quando com "10/10/2019"
    And eu clico em Create Manutencao
    Then eu devo ver que a manutencao com descricao "trocar pneus" foi agendada corretamente

  Scenario: desagendar corretamente uma manutencao
    agendar corretamente uma manutencao
    And eu vejo uma manutencao com descricao "trocar pneus" ja existente
    And eu clico no botao Remover ao lado da manutencao com descriao "trocar pneus"
    Then eu devo ver que a manutencao com descricao "trocar pneus" foi desagendada corretamente

  Scenario: alterar corretamente as informacoes de uma manutencao
    agendar corretamente uma manutencao
    And eu vejo uma manutencao com descricao "trocar pneus" ja existente
    And eu clico no botao com o nome "trocar pneus"
    And eu clico no botao Editar
    And eu preencho os novos campos de usuario com "Teste", veiculo com "aaa1111", descricao com "trocar pneus", custo com "150", realizado em com "Pneu dourado" e realizado quando com "01/11/2019"
    And eu clico no botao Update Manutencao
    Then eu devo ver que o veiculo agora tem usuario tem "Teste", veiculo tem "aaa1111", descricao tem "trocar pneus", custo tem "150", realizado em tem "Pneu dourado" e realizado quando tem "01/11/2019"

  Scenario: visualizar as informacoes de uma manutencao
    agendar corretamente uma manutencao
    And eu vejo uma manutencao com descricao "trocar pneus" ja existente
    And eu clico no botao com o nome "trocar pneus"
    Then eu devo ver que a manutencao com a descricao "trocar pneus" tem as informacoes corretas