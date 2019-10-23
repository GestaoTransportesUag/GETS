Feature: Veiculo
  As um administrador do sistema de gerencia do setor de veiculos
  I want to adicionar, atualizar dados, verificar informacoes e remover veiculos da frota
  so that eu nao preciso fazer isso manualmente

  Scenario: adicionar corretamente um veiculo
    Given eu estou na pagina inicial
    When eu clico no link chamado Veiculos
    And estou na pagina que lista veiculos
    And eu clico em Novo Veiculo
    And estou na pagina de adicionar um veiculo
    And eu preencho os campos de placa com "HX576CA", modelo com "Caminhonete", ano com "1998", cor com "Vermelho" e quilometragem com "10000"
    And eu clico em Create Veiculo
    Then eu devo ver que o veiculo com placa "HX576CA" foi adicionado corretamente

