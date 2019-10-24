require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'Nao deve salvar um usuario sem atributos' do
    usuario = Usuario.new
    assert_not usuario.save
  end

  test 'Nao deve salvar um usuario sem email' do
    usuario = Usuario.new cpf:11111111111, nome: "Jose", senha: 000000,  telefone: 981380507, capacidadeDeGerencia: false
    assert_not usuario.save
  end

  test 'Nao deve salvar um usuario com senha maior que 6 digitos' do
    usuario = Usuario.new cpf: 1111111111, nome: "Jose", senha: 0000000000, email: "qualquercoisa@gmail.com", telefone: 981380507, capacidadeDeGerencia: false
    assert_not usuario.save
  end
end
