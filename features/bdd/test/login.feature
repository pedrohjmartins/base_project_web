#language: pt

Funcionalidade: Login
Para validar a autenticação do sistema
Como usuário do sistema
Quero logar e validar as permissões

Contexto: possibilidade de acessar o sistema
Dado que o usuário esteja na tela de login do sistema

            @loginvalido @criticidade:critical @functional @doing
            Esquema do Cenário: Login válido
            Quando informar um login com <email> e <senha> válidos
            Então o sistema deve permitir a autenticação do usuário
            E o tipo de <permissao> deve ser exibido


            Exemplos:
            | email                | senha | permissionamento |
            | "admin@admin"        | "123" | "Administrador"  |
            | "gerente@provac.com" | "123" | "Gerente"        |


            @logininvalido @criticidade:critical @functional
            Esquema do Cenário: Login inválido
            Quando informar um login com <email> e <senha> inválido
            Então o sistema não deve permitir a autenticação do usuário
            E uma <mensagem> informando o motivo deve ser exibida

            Exemplos:
            | email         | senha  | mensagem                              |
            | "admin@admin" | "1234" | 'Combinação de Login/Senha inválida.' |
            | "admin@admi"  | "123"  | 'Combinação de Login/Senha inválida.' |

