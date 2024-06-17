/// <reference types="cypress" />

import checkoutContaPage from "../support/page_objects/checkout.page";
import produtosPage from "../support/page_objects/produtos.page";

context('Exercicio - Testes End-to-end - Fluxo de pedido', () => {
  /*  Como cliente 
      Quero acessar a Loja EBAC 
      Para fazer um pedido de 4 produtos 
      Fazendo a escolha dos produtos
      Adicionando ao carrinho
      Preenchendo todas opções no checkout
      E validando minha compra ao final */

  beforeEach(() => {
      cy.visit('produtos')
  });

  it('Deve fazer um pedido na loja Ebac Shop de ponta a ponta', () => {
    //Seleciona produto e adiciona no carrinho
    cy.fixture('produtos').then(dados => {
        produtosPage.buscarProduto(dados[0].nomeProduto)
        produtosPage.addProdutoCarrinho(
            dados[0].tamanho,
            dados[0].cor,
            dados[0].quantidade)
        cy.get('.woocommerce-message').should('contain', dados[0].nomeProduto)
    })
    //Abre carrinho
    cy.get('.woocommerce-message > .button').click()

    //Valida itens carrinho
    cy.get('.order-total').should('contain','130,00')
    cy.get('.checkout-button').click()

    //Preenche dados para finalizar venda
    checkoutContaPage.checkoutConta()

    //Valida valor antes de finalizar venda
    cy.get('.order-total').should('contain', '130,00')

    //Finaliza a venda
    cy.FormaPagamento('pagamento na entrega')
    cy.FinalizaCompra()
    
    //Valida Compra finalizada
    cy.get('.page-header').should('contain', 'Pedido recebido')
    cy.get('.woocommerce-notice').should('contain', 'Obrigado. Seu pedido foi recebido.')
    cy.get('.woocommerce-table__line-item > .woocommerce-table__product-name').should('contain', 'Apollo Running Short - 33, Black')
    cy.get('.woocommerce-table__product-total').contains('span', '130,00')
  });


})