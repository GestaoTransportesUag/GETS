Feature: Veiculo
  As um administrador do sistema de gerencia do setor de veiculos
  I want to agendar, atualizar dados, verificar informacoes e desagendar viagens
  so that eu nao preciso fazer isso manualmente

  Scenario: agendar corretamente uma viagem
    Given eu estou na pagina inicial
    When eu clico no link chamado Viagens
    And estou na pagina que lista viagens
    And eu clico em Agendar Viagem
    And estou na pagina de agendar uma viagem
    And eu preencho os campos de usuario com "Teste", veiculo com "HX576CA", motorista com "Marta", distancia percorrida com "0", finalidade com "Pesquisa", nome do requisitor com "Joaquim", funcao do requisitor com "professo", cpf do requisitor com "00000000000", numero de acompanhantes com "0", data de partida com "01/11/2019 08:00", data de chegada com "01/11/2019/2019 20:00" e destino com "Angelim"
    And eu clico em Create Viagem
    Then eu devo ver que a viagem com destino "Angelim" foi agendada corretamente

  Scenario: desagendar corretamente uma viagem
    Given eu estou na pagina inicial
    When eu clico no link chamado Viagens
    And estou na pagina que lista viagens
    And eu vejo uma viagem com destino "Angelim" ja existente
    And eu clico no botao Remover
    Then eu devo ver que a viagem com destino "Angelim" foi desagendada corretamente

  Scenario: alterar corretamente as informacoes de uma viagem
    Given eu estou na pagina inicial
    When eu clico no link chamado Viagens
    And estou na pagina que lista viagens
    And eu vejo uma viagem com destino "Angelim" ja existente
    And eu clico no botao com o nome do destino "Angelim"
    And eu clico no botao Editar
    And eu preencho os campos de usuario com "Teste", veiculo com "HX576CA", motorista com "Motorista", distancia percorrida com "0", finalidade com "Pesquisa", nome do requisitor com "Joaquim", funcao do requisitor com "professo", cpf do requisitor com "00000000000", numero de acompanhantes com "0", data de partida com "01/11/2019 08:00", data de chegada com "01/11/2019/2019 20:00" e destino com "Pesqueira"
    And eu clico no botao Update Veiculo
    Then eu devo ver que o veiculo agora tem usuario "Teste", veiculo "HX576CA", motorista "Motorista", distancia percorrida "0", finalidade "Pesquisa", nome do requisitor "Joaquim", funcao do requisitor "professo", cpf do requisitor "00000000000", numero de acompanhantes "0", data de partida "01/11/2019 08:00", data de chegada "01/11/2019/2019 20:00" e destino "Pesqueira"

  Scenario: visualizar as informacoes de uma viagem
    Given eu estou na pagina inicial
    When eu clico no link chamado Viagens
    And estou na pagina que lista viagens
    And eu vejo uma viagem com destino "Angelim" ja existente
    And eu clico no botao com o nome do destino "Angelim"
    Then eu devo ver que a viagem com o destino "Angelim" tem as informacoes corretas

  Scenario: agendar uma viagem sem motorista
    Given eu estou na pagina inicial
    When eu clico no link chamado Viagens
    And estou na pagina que lista viagens
    And eu clico em Agendar Viagem
    And estou na pagina de agendar uma viagem
    And eu preencho os campos de usuario com "Teste", veiculo com "HX576CA",  distancia percorrida com "0", finalidade com "Pesquisa", nome do requisitor com "Joaquim", funcao do requisitor com "professo", cpf do requisitor com "00000000000", numero de acompanhantes com "0", data de partida com "01/11/2019 08:00", data de chegada com "01/11/2019/2019 20:00" e destino com "Pesqueira"
    And eu clico em Create Viagem
    Then eu vejo uma mensagem de erro indicando que a viagem nao pode ser agendada