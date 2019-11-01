json.extract! manutencao, :id, :usuario_id, :veiculo_id, :descricao, :custo, :realizadoEm, :realizadoQuando, :created_at, :updated_at
json.url manutencao_url(manutencao, format: :json)
