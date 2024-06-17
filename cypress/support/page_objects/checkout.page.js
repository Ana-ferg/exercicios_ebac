import { faker } from '@faker-js/faker';
const dados = require('../../fixtures/perfil.json')
class checkoutContasPage {

    checkoutConta() {
        var nome = faker.person.firstName()
        var sobrenome = faker.person.lastName()
        var email = faker.internet.email(nome, sobrenome)
        var pais = faker.location.country()
        var estado = faker.location.state()

        cy.get('#billing_first_name').type(faker.person.firstName())
        cy.get('#billing_last_name').type(faker.person.lastName())
        cy.SelecionaItemCombo('#select2-billing_country-container', pais)
        cy.get('#billing_address_1').type(faker.location.streetAddress())
        cy.get('#billing_address_2').type('12')
        cy.get('#billing_city').type(faker.location.city())
        cy.SelecionaItemCombo('#select2-billing_state-container', estado)
        cy.get('#billing_postcode').type('75680362')
        cy.get('#billing_phone').type('64995441652')
        cy.get('#billing_email').type(faker.internet.email(nome, sobrenome))
        cy.get('#createaccount').click()
        cy.get('#account_password').type(dados.senha)
    }
}

export default new checkoutContasPage()