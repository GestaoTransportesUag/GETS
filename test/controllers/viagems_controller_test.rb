require 'test_helper'

class ViagemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @viagem = viagems(:one)
  end

  test "should get index" do
    get viagems_url
    assert_response :success
  end

  test "should get new" do
    get new_viagem_url
    assert_response :success
  end

  test "should create viagem" do
    assert_difference('Viagem.count') do
      post viagems_url, params: { viagem: { cpfRequisitor: @viagem.cpfRequisitor, dataChegada: @viagem.dataChegada, dataPartida: @viagem.dataPartida, descricaoImprevistos: @viagem.descricaoImprevistos, destino: @viagem.destino, distanciaPercorrida: @viagem.distanciaPercorrida, finalidade: @viagem.finalidade, funcaoRequisitor: @viagem.funcaoRequisitor, horaChegada: @viagem.horaChegada, horaSaida: @viagem.horaSaida, motorista_id: @viagem.motorista_id, nomeRequisor: @viagem.nomeRequisor, numAcompanhantes: @viagem.numAcompanhantes, usuario_id: @viagem.usuario_id, veiculo_id: @viagem.veiculo_id } }
    end

    assert_redirected_to viagem_url(Viagem.last)
  end

  test "should show viagem" do
    get viagem_url(@viagem)
    assert_response :success
  end

  test "should get edit" do
    get edit_viagem_url(@viagem)
    assert_response :success
  end

  test "should update viagem" do
    patch viagem_url(@viagem), params: { viagem: { cpfRequisitor: @viagem.cpfRequisitor, dataChegada: @viagem.dataChegada, dataPartida: @viagem.dataPartida, descricaoImprevistos: @viagem.descricaoImprevistos, destino: @viagem.destino, distanciaPercorrida: @viagem.distanciaPercorrida, finalidade: @viagem.finalidade, funcaoRequisitor: @viagem.funcaoRequisitor, horaChegada: @viagem.horaChegada, horaSaida: @viagem.horaSaida, motorista_id: @viagem.motorista_id, nomeRequisor: @viagem.nomeRequisor, numAcompanhantes: @viagem.numAcompanhantes, usuario_id: @viagem.usuario_id, veiculo_id: @viagem.veiculo_id } }
    assert_redirected_to viagem_url(@viagem)
  end

  test "should destroy viagem" do
    assert_difference('Viagem.count', -1) do
      delete viagem_url(@viagem)
    end

    assert_redirected_to viagems_url
  end
end
