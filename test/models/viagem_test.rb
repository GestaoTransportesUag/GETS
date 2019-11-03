require 'test_helper'

class ViagemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'Nao deve agendar uma viagem sem atributos'do
    viagem = Viagem.new
    assert_not viagem.save
  end

  test 'Nao deve agendar uma viagem sem motorista' do
    veiculo = Veiculo.new placa: "aaa1111", modelo: "Gol", ano: 2010,  cor: "branco", quilometragem: 20000
    usuario = Usuario.new cpf:11111111111, nome: "Jose", senha: 000000,  telefone: 981380507, capacidadeDeGerencia: false, email: "email@gmail.com"
    viagem = Viagem.new veiculo: veiculo, usuario: usuario, finalidade: "Pesquisa", distanciaPercorrida: 100, nomeRequisor: "Geraldo", funcaoRequisitor:"Professor", cpfRequisitor:11111111111, numAcompanhantes: 0, dataPartida: 1112019, dataChegada: 1112019, horaSaida:800, horaChegada: 2000, destino: "Natal"
    assert_not viagem.save
  end

  test 'Nao deve agendar uma viagem sem especificacao de finalidade' do
    veiculo = Veiculo.new placa: "aaa1111", modelo: "Gol", ano: 2010,  cor: "branco", quilometragem: 20000
    usuario = Usuario.new cpf:11111111111, nome: "Jose", senha: 000000,  telefone: 981380507, capacidadeDeGerencia: false, email: "email@gmail.com"
    motorista = Motorista.new cpf:11111111111, numeroDeHoras: 0, bancoDeHoras: false, telefone: 981380507, nome: "Claudio"
    viagem = Viagem.new veiculo: veiculo, usuario: usuario, motorista: motorista, distanciaPercorrida: 100, nomeRequisor: "Geraldo", funcaoRequisitor:"Professor", cpfRequisitor:11111111111, numAcompanhantes: 0, dataPartida: 1112019, dataChegada: 1112019, horaSaida:800, horaChegada: 2000, destino: "Natal"
    assert_not viagem.save
  end

end
