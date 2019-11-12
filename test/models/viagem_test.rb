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
    veiculo = Veiculo.new placa: "aaa1111", modelo: "caminhonete", ano: 2010,  cor: "branco", quilometragem: 20000
    usuario = Usuario.new cpf:11111111111, nome: "Jose", senha: 000000,  telefone: 981380507, capacidadeDeGerencia: false, email: "email@gmail.com"
    viagem = Viagem.new veiculo: veiculo, usuario: usuario, finalidade: "Pesquisa", distanciaPercorrida: 100, nomeRequisor: "Geraldo", funcaoRequisitor:"Professor", cpfRequisitor:11111111111, numAcompanhantes: 0, dataPartida: "01/11/2019 08:00", dataChegada: "01/11/2019 20:00", destino: "Natal"
    assert_not viagem.save
  end

  test 'Nao deve agendar uma viagem sem especificacao de finalidade' do
    veiculo = Veiculo.new placa: "aaa1111", modelo: "caminhonete", ano: 2010,  cor: "branco", quilometragem: 20000
    usuario = Usuario.new cpf:11111111111, nome: "Jose", senha: 000000,  telefone: 981380507, capacidadeDeGerencia: false, email: "email@gmail.com"
    motorista = Motorista.new cpf:11111111111, telefone: 981380507, nome: "Claudio"
    viagem = Viagem.new veiculo: veiculo, usuario: usuario, motorista: motorista, distanciaPercorrida: 100, nomeRequisor: "Geraldo", funcaoRequisitor:"Professor", cpfRequisitor:11111111111, numAcompanhantes: 0, dataPartida: "01/11/2019 08:00", dataChegada: "01/11/2019 20:00",  destino: "Natal"
    assert_not viagem.save
  end

end
