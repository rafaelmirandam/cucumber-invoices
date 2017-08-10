#language: pt

Funcionalidade: Começar jogo
    Para poder passar o tempo
    Como jogador
    Quero poder começar um novo jogo

    Cenario: Começo de novo jogo com sucesso
        Ao começar jogo, é mostrada a mensagem inicial
        para o jogador.

        Quando começo um novo jogo
        Então veja a seguinte mensagem na tela:
        """
        Bem vindo ao jogo da forca!
        """