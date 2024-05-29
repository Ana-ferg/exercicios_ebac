 #language: pt

            Funcionalidade: Configuracao de produto
            Como cliente EBAC-SHOp
            Quero configurar meu produto de acordo com meu tamanho e gosto
            E escolher a quantidade
            Para depois inserir no carrinho

            Contexto:
            Dado que o usuário selecione uma peça de roupa

            Cenário: Adicionar produto no carrinho sem selecionar quantidade,cor ou tamanho
            Quando o usuário deixar de selecionar a quantidade, cor ou tamanho
            Então deve exibir uma mensagem de alerta "A quantidade, cor e tamanho do produto deve ser informada!"

            Cenário: Adicionar produto no carrinho com todas as configurações informadas
            Quando o usuário preencher os campos obrigatórios
            Então deve exibir uma mensagem de alerta "Produto adicionado com sucesso no carrinho!"

            Cenário: Botão "Limpar" configurações de produto
            Dado que o usuário configure as informações para adicionar o produto no carrinho
            Quando clicar na opção "Limpar"
            Então deve limpar as configurações para o estado original

            Cenário: Não permitir exceder a quantidade máxima por venda(10 itens)
            Dado que o usuário selecione 11 itens no carrinho
            Quando o usuário clicar em "Efetivar compra"
            Então deve exibir uma mensagem de alerta "Permitido apenas 10 itens por venda!"
