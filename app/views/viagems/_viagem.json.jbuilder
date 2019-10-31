json.extract! viagem, :id, :usuario_id, :veiculo_id, :motorista_id, :distanciaPercorrida, :nomeRequisor, :finalidade, :funcaoRequisitor, :cpfRequisitor, :descricaoImprevistos, :numAcompanhantes, :dataPartida, :dataChegada, :destino, :horaSaida, :horaChegada, :created_at, :updated_at
json.url viagem_url(viagem, format: :json)
