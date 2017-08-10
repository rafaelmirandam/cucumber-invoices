#language: pt

@delete
Funcionalidade: Remover cliente
    Sendo um usuário do Invoices
    Posso remover um cliente do cadastro

@customer_page @smoke @logout
Cenario: Remover cliente com sucesso

    Dado que eu tenho um cliente
    Quando faço a exclusão desse cliente
    Então esse cliente não deve ser exibido na busca
