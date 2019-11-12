require 'test_helper'

class ManutencaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'Nao deve agendar uma manutencao sem atributos' do
    manutencao = Manutencao.new
    assert_not manutencao.save
  end

  test 'Nao deve agendar uma manutencao sem veiculo' do
    usuario = Usuario.new cpf:11111111111, nome: "Jose", senha: 000000,  telefone: 981380507, capacidadeDeGerencia: false, email: "email@gmail.com"
    manutencao = Manutencao.new usuario: usuario, descricao: "Trocar pneus", custo: 150, realizadoEm: "Pneu dourado", realizadoQuando: "01/11/2019"
    assert_not manutencao.save
  end

  test 'Nao deve agendar uma manutencao sem custo' do
    veiculo = Veiculo.new placa: "aaa1111", modelo: "caminhonete", ano: 2010,  cor: "branco", quilometragem: 20000
    usuario = Usuario.new cpf:11111111111, nome: "Jose", senha: 000000,  telefone: 981380507, capacidadeDeGerencia: false, email: "email@gmail.com"
    manutencao = Manutencao.new usuario: usuario, veiculo: veiculo, descricao: "Trocar pneus", realizadoEm: "Pneu dourado", realizadoQuando: "01/11/2019"
    assert_not manutencao.save
  end

end
