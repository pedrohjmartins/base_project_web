#language: pt

Funcionalidade: Login
Para validar a autenticação da api
Como usuário do sistema
Quero verificar as validações da api

Contexto: Validar requisições de acesso através da api

            @loginvalidoapi @api @criticidade:critical
            Esquema do Cenário: Login válido
            Dado uma requisição de login com <email> e <senha> válido
            Então deve ser autenticado com sucesso na api

            Exemplos:
            | email                | senha |
            | "admin@admin"        | "123" |
            | "gerente@provac.com" | "123" |

            @logininvalidoapi @api @criticidade:critical
            Esquema do Cenário: Login inválido
            Dado uma requisição de login com <email> e ou <senha> inválido
            Então não deve ser autenticado
            E uma <mensagem> de retorno da api deve ser exibido

            Exemplos:
            | email         | senha  | mensagem                              |
            | "admin@admi"  | "1234" | 'Combinação de Login/Senha inválida.' |
            | "admin@admin" | "1234" | 'Combinação de Login/Senha inválida.' |
            | "admin@admi"  | "123"  | 'Combinação de Login/Senha inválida.' |