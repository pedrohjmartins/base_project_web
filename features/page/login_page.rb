# Classe que representa a tela de login
class LoginPage < SitePrism::Page
  set_url '/login'

  element :campo_email, "input[type='email']"
  element :campo_senha, "input[type='password']"
  element :btn_entrar, "button[type='submit']"

  def realizarlogin(email, senha)
    campo_email.set email
    campo_senha.set senha
    btn_entrar.click
  end
end
