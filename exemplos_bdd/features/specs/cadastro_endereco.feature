#language:pt

Funcionalidade: Cadastro de endereço
    Sendo um cliente quem um carrinho de compra e fez checkout
    Posso adicionar um endereço de entrega
    Para que os items sejam entregue neste endereço


# Cenario: Add endereço de entrega

#     Dado que cliquei em finalizar compra
#     Então vejo a página de cadastro de endereço
#         E clico em adicionar endereço
#         E preencho o nome da rua
#         E preencho o numero
#         E preencho o bairro
#         E preencho o cidade
#         E preencho o estado
#         E preencho o CEP
#     Quando clico em cadastrar endereço
#     Então o endereço é cadastrado

Cenario: Add endereço de entrega

    Dado que eu tenho um endereço de entrega:
        |Rua|Av Paulista|
        |Numero| 1000|
        |Bairro| Cerqueira Cezar|
        |Cidade| Sao Paulo|
        |Estado| SP|
        |CEP| 0000000|
    Quando faço o cadastro desse endereço
    Então vejo esse endereço disponível para entrega        


