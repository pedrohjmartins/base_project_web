Dado('uma requisição de login com {string} e {string} válido') do |email, senha|
  @body = {
    "email": email,
    "password": senha
  }.to_json

  @post_login = HTTParty.post 'https://test.provac.s2it.com.br/api/token/employee',
                              body: @body,
                              headers: {
                                'Content-Type' => 'application/json'
                              }
end

Então('deve ser autenticado com sucesso na api') do
  puts @post_login.body
  puts @post_login.message

  expect(@post_login.code).to eq 201
end

Dado('uma requisição de login com {string} e ou {string} inválido') do |email, senha|
  @body = {
    "email": email,
    "password": senha
  }.to_json

  @post_login = HTTParty.post 'https://test.provac.s2it.com.br/api/token/employee',
                              body: @body,
                              headers: {
                                'Content-Type' => 'application/json'
                              }
end

Então('não deve ser autenticado') do
  puts @post_login.body
  puts @post_login.message

  expect(@post_login.code).to eq 401
end

Então('uma {string} de retorno da api deve ser exibido') do |mensagem|
  json_object = JSON.parse @post_login.body
  errors = json_object['errors']
  expect(errors[0]).to eq mensagem
end
