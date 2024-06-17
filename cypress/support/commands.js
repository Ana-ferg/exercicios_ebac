import { faker } from '@faker-js/faker';

Cypress.Commands.add('login', (usuario, senha) => {
    cy.get('#username').type(usuario)
    cy.get('#password').type(senha, {log: false})
    cy.get('.woocommerce-form > .button').click()
});

Cypress.Commands.add('SelecionaItemCombo',(objeto, nomeItem) =>{
    cy.get(objeto).click()
    cy.get(objeto).type(nomeItem)
    cy.get(objeto).click()
})

Cypress.Commands.add('FormaPagamento', (menuOption) => {
    
    if (menuOption === 'transferencia') {
        cy.get('#payment_method_bacs').click()

    } else if (menuOption === 'cheque') {
        cy.get('#payment_method_cheque').click()

    } else if (menuOption === 'pagamento na entrega') {
        cy.get('#payment_method_cod').click()
    }
})

Cypress.Commands.add('FinalizaCompra',(objeto, nomeItem) =>{
    cy.get('#terms').click()
    cy.get('[name="woocommerce_checkout_place_order"]').click()
})