            #language: pt

            Funcionalidade: checkout  - Tela de cadastro
            Como cliente da EBAC-SHOP
            Quero concluir meu cadastro
            Para finalizar minha compra

            Cenário: Preenchimento dos campos obrigatórios
            Dado que o usuário preencha todos os campos obrigatórios
            Quando o usuário clicar em "finalizar compra"
            Então deve exibir uma mensagem de alerta "Compra finalizada com sucesso!"

            Cenário: email formato invalido
            Dado que o usuário informe o email "a142.com.br"
            Quando o usuário clicar em "finalizar compra"
            Então deve exibir uma mensagem de alerta "Email em formato inválido, informe um formato válido(ex: ebacshop@ebacshop.com.br)!"

            Cenário: sem Preenchimento dos campos obrigatórios
            Dado que o usuário queira finalizar a compra sem informar nenhum dado obrigatório
            Quando o usuário clicar em "finalizar compra"
            Então deve exibir uma mensagem de alerta "Todos os campos obrigatórios devem ser informados!"

            Esquema do Cenário: Cenário: múltiplos cenários de preenchimento
            Dado que o usuário não informe o campo <campoObrigatorio>
            Quando o usuário clicar em "finalizar compra"
            Então deve exibir uma mensagem de alerta "O campo obrigatório"+ <campoObrigatorio> +"deve ser informado!"

            Exemplos
            | campoObrigatorio     |
            | "Nome"               |
            | "Sobrenome"          |
            | "País"               |
            | "Endereço"           |
            | "Cidade"             |
            | "CEP"                |
            | "Telefone"           |
            | "Endereço de e-mail" |


