            #language: pt

            Funcionalidade: login na plataforma
            Como cliente EBAC-SHOP
            Quero fazer o login(autenticação) na plataforma
            Para visualizar meus pedidos

            Contexto:
            Dado que o usuário acesse a página de autenticação da EBAC - SHOP

            Cenário: Autenticação válido
            Quando eu digitar o usuário "ana@gmail.com.br"
            E a senha "abc@123"
            Então deve ser direcionado para a tela de checkout.

            Esquema do Cenário: Cenário: Múltiplas Autenticações plataforma
            Quando eu digitar o <usuario>
            E a <senha>
            Então Deve exibir uma mensagem de alerta <mensagem>.

            Exemplos
            | usuario            | senha     | mensagem                               |
            | "!@#$%¨&*_+"       | "  "      | "Usuário inexistente"                  |
            | ""                 | ""        | "Usuário e senha devem ser informados" |
            | "ana@gmail.combr"  | "abc@123" | "Usuário inexistente"                  |
            | "ana@gmail.com.br" | " #$%@!@" | "Usuário ou senha inválidos"           |