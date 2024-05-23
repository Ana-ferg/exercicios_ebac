 #language: pt

            Funcionalidade: Configuracao de produto
            Como cliente EBAC-SHOp
            Quero configurar meu produto de acordo com meu tamanho e gosto
            E escolher a quantidade
            Para depois inserir no carrinho

            Contexto:
            Dado que o usuário selecione uma peça de roupa

            Cenário: Adicionar produto no carrinho sem selecionar quantidade
            Quando o usuário selecionar a cor desejada
            E selecionar o tamanho
            Então deve exibir uma mensagem de alerta "A quantidade do produto deve ser informada!"

            Cenário: Adicionar produto no carrinho sem selecionar cor
            Quando o usuário selecionar a quantidade desejada
            E selecionar o tamanho
            Então deve exibir uma mensagem de alerta "A cor do produto deve ser informada!"

            Cenário: Adicionar produto no carrinho sem selecionar tamanho
            Quando o usuário selecionar a cor do produto
            E selecionar a quantidade
            Então deve exibir uma mensagem de alerta "O tamanho do produto deve ser informado!"

            Cenário: Adicionar produto no carrinho com todas as configurações informadas
            Quando o usuário preencher os campos obrigatórios
            Então deve exibir uma mensagem de alerta "Produto adicionado com sucesso no carrinho
            !"

            Cenário: Botão "Limpar" configurações de produto
            Dado que o usuário configure as informações para adicionar o produto no carrinho
            Quando clicar na opção "Limpar"
            Então deve limpar as configurações para o estado original

            Cenário: Efetivar mais de 10 ites no carrinho
            Dado que o usuário selecione 11 itens no carrinho
            Quando o usuário clicar em "Efetivar compra"
            Então deve exibir uma mensagem de alerta "Permitido apenas 10 itens por venda!"

            Cenário: Efetivar 9 ites no carrinho
            Dado que o usuário selecione 9 itens no carrinho
            Quando o usuário clicar em "Efetivar compra"
            Então deve exibir uma mensagem "Permitido apenas 10 itens por venda!"