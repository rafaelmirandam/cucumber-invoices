#encoding: utf-8

require_relative '../../../src/game.rb'

Quando(/^começo um novo jogo$/) do
  @game = Game.new
  @game.start
end

Então(/^veja a seguinte mensagem na tela:$/) do |msg|
  expect(@game.output).to eql msg
end
