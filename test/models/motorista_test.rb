require 'test_helper'

class MotoristaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'Nao deve salvar um motorista sem atributos' do
    motorista = Motorista.new
    assert_not motorista.save
  end

  test 'Nao deve salvar um motorista sem nome' do
    motorista = Motorista.new cpf:11111111111, diasDeFolga: 0, bancoDeHoras: false, telefone: 981380507
    assert_not motorista.save
  end

  test 'Nao deve salvar um motorista com cpf menor que 11 digitos' do
    motorista = Motorista.new cpf: 1111111111,nome: "Jose", diasDeFolga: 0, bancoDeHoras: false, telefone: 981380507
    assert_not motorista.save
  end


end
