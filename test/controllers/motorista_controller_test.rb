require 'test_helper'

class MotoristaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @motorista = motorista(:one)
  end

  test "should get index" do
    get motorista_index_url
    assert_response :success
  end

  test "should get new" do
    get new_motorista_url
    assert_response :success
  end

  test "should create motorista" do
    assert_difference('Motorista.count') do
      post motorista_index_url, params: { motorista: { bancoDeHoras: @motorista.bancoDeHoras, cpf: @motorista.cpf, diasDeFolga: @motorista.diasDeFolga, nome: @motorista.nome, telefone: @motorista.telefone } }
    end

    assert_redirected_to motorista_url(Motorista.last)
  end

  test "should show motorista" do
    get motorista_url(@motorista)
    assert_response :success
  end

  test "should get edit" do
    get edit_motorista_url(@motorista)
    assert_response :success
  end

  test "should update motorista" do
    patch motorista_url(@motorista), params: { motorista: { bancoDeHoras: @motorista.bancoDeHoras, cpf: @motorista.cpf, diasDeFolga: @motorista.diasDeFolga, nome: @motorista.nome, telefone: @motorista.telefone } }
    assert_redirected_to motorista_url(@motorista)
  end

  test "should destroy motorista" do
    assert_difference('Motorista.count', -1) do
      delete motorista_url(@motorista)
    end

    assert_redirected_to motorista_index_url
  end
end
