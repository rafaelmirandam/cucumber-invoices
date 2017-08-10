#language:pt


Funcionalidade: Login

    Cenario: Usuário faz login

        Dado estou na página de login
            E preencho o usuário com o email "eu@papito.io"
            E preenho a senha com o valor "teste#123"
        Quando clico no botão Logar
        Então sou logado no sistema

# Funcionalidade: Login

#     Cenario: Usuário faz login

#         Dado que eu tenho um usuário se senha com os seguintes atributos:
#             |email|eu@papito.io |
#             |senha|test#123     |
#         Quando faço login
#         Então vejo a página minha conta

