require 'test_helper'

class VeiculoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'Nao deve salvar um veiculo sem atributos'do
    veiculo = Veiculo.new
    assert_not veiculo.save
  end

  test 'Nao deve salvar um veiculo sem quilometragem' do
    veiculo = Veiculo.new placa: "aaa1111", modelo: "Gol", ano: 2010,  cor: "branco"
    assert_not veiculo.save
  end

  test 'Nao deve salvar um usuario com placa menor que 7 digitos' do
    veiculo = Veiculo.new placa: "aaa11", modelo: "Gol", ano: 2010,  cor: "branco", quilometragem: 0000
    assert_not veiculo.save
  end
end
