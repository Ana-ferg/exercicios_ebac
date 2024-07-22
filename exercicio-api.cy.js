/// <reference types="cypress" />

import usuario from "../contracts/usuarios.contract";

describe('Testes Funcionalidade Usuários', () => {

  it('Deve validar contrato de usuários', () => {
    cy.request('usuarios').then(response =>{
      return usuario.validateAsync(response.body)
    })
  });

  it('Deve listar usuários cadastrados', () => {
    cy.request({
      method: 'GET',
      url: 'usuarios',
  }).should((response) => {
      expect(response.status).to.equal(200)
      expect(response.body).to.have.property("usuarios")
  })
  });

  it('Deve cadastrar um usuário com sucesso', () => {
    let token
    cy.token('fulano@qa.com','teste').then(tkn =>{
      token = tkn
    })
    let nome = 'Usuario' + Math.floor(Math.random() * 100000000)
    let email = 'Usuario'+ Math.floor(Math.random() * 100000000)+'@gmail.com'
    cy.cadastrarUsuario(token,nome,email,'A123456','true').should((response) => {
      expect(response.status).to.equal(201)
      expect(response.body.message).to.equal("Cadastro realizado com sucesso")
  })
  });

  it('Deve validar um usuário com email inválido', () => {
    cy.request({
      method: 'POST',
      url: 'login',
      body: {
          "email": "Test@gmail.com",
          "password": 'a125346' 
      },
      failOnStatusCode: false
    }).then((response) => {
        expect(response.status).to.equal(401)
        expect(response.body.message).to.equal('Email e/ou senha inválidos')
    }) 
  });

  it('Deve editar um usuário previamente cadastrado', () => {
    let nome = 'Usuario' + Math.floor(Math.random() * 100000000)
    cy.request({
      method: 'PUT',
      url: 'usuarios/9pqfVJkHLxfuPQL0',
      body: {
          "nome": nome,
            "email": 'teste@ebacs.com.br',
            "password": 'password',
            "administrador": 'true'
      }
      }).then((response) => {
        expect(response.status).to.equal(200)
        expect(response.body.message).to.equal('Registro alterado com sucesso')
    }) 
  });

  it('Deve deletar um usuário previamente cadastrado', () => {
    let token
    cy.token('fulano@qa.com','teste').then(tkn =>{
      token = tkn
    })
    let nome = 'Usuario' + Math.floor(Math.random() * 100000000)
    let email = 'Usuario'+ Math.floor(Math.random() * 100000000)+'@gmail.com'
    cy.cadastrarUsuario(token,nome,email,'A123456','true')
    .then((response) => {
      let id = response.body._id
      cy.request({
        method: 'DELETE',
        url: `usuarios/${id}`,
        headers: {authorization: token},
    }).should(resp =>{
        expect(resp.body.message).to.equal('Registro excluído com sucesso')
        expect(resp.status).to.equal(200)
    })
  })
  });


});
