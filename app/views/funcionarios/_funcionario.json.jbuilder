json.extract! funcionario, :id, :nome, :matricula, :data_nascimento, :sexo, :lotacao, :cargo, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
