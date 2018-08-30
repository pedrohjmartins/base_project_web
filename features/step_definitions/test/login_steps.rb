Dado('que o usuário esteja na tela de login do sistema') do
  @login_page.load
end

Quando('informar um login com {string} e {string} válidos') do |_string, _string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Então('o sistema deve permitir a autenticação do usuário') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('o tipo de <permissao> deve ser exibido') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('informar um login com {string} e {string} inválido') do |_string, _string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Então('o sistema não deve permitir a autenticação do usuário') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('uma {string} informando o motivo deve ser exibida') do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end
