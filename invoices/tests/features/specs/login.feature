#language: pt

Funcionalidade: Login
    Sendo um usuário
    Posso logar no sistema Invoices
    Para cadastrar clientes e tambem lançar cobranças

@logout @smoke
Cenario: Administrador faz login

    * acessa a página login

    Dado que eu tenho um usuário "admin"
    Quando faço login
    Então vejo o dashboard
        E a mensagem "Bem Vindo Kato Danzo!"

Esquema do Cenario: Tentativa de login

    Dado que eu tenho o usuário <email> e <senha>
    Quando faço login
    Então vejo a mensagem <msg>

    Exemplos:
    | email                       | senha    | msg                                 |
    | "kato.danzo@qaninja.com.br" | "123456" | "Incorrect password"                |
    | "kato.danzo@qaninja.net"    | "secret" | "User not found"                    |
    | "kato.danzo&qaninja.com.br" | "secret" | "Please enter your e-mail address." |
