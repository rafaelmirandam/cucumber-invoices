#language:pt

Funcionalidade: Cadastro de clientes
    Sendo um usuário do Invoices
    Posso cadastrar novos clientes
    Para fins de gerenciamento e tambem atendimento

Contexto: Usuário acessa página clientes
    * usuário logado acessa a página de clientes

Cenario: Cadatro de novo cliente

    Dado que eu tenho novo cliente
    Quando faço o cadastro desse cliente
    Então vejo esse cliente na busca

Cenario: Cadastro de clientes
    Ao cadastrar um novo cliente, o mesmo
    deve ser exibido na busca

    Dado que eu tenho uma lista de clientes
    Quando faço o cadastro desses clientes
    Então vejo esses clientes na busca
