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

            Cenário: Usuário inexistente
            Quando eu digitar o usuário "jwwwwwww@outlook.com.br"
            E a senha "abc@123"
            Então deve exibir uma mensagem de alerta "Usuário inexistente"

            Cenário: Usuário com senha inválida
            Quando eu digitar o usuário "ana@gmail.com.br"
            E a senha "dfg@123"
            Então deve exibir uma mensagem de alerta "Usuário ou senha inválidos"

            Esquema do Cenário: Cenário: Autenticar múltiplos usuários
            Quando eu digitar o <usuario>
            E a <senha>
            Então deve ser direcionado para a tela de checkout.

            Exemplos
            | usuario               | senha       |
            | "joao@ebac.com.br"    | "senha@123" |
            | "maria@ebac.com.br"   | "abc@123"   |
            | "pedro@ebac.com.br"   | "dfg@123"   |
            | "gabriel@ebac.com.br" | "hij@123"   |