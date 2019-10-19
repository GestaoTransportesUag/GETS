json.extract! usuario, :id, :cpf, :nome, :senha, :email, :telefone, :capacidadeDeGerencia, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
