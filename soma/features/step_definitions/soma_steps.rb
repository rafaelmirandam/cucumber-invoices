#encoding:utf-8

Quando(/^faço a soma de (\d+) \+ (\d+)$/) do |valor1, valor2|
  @soma = valor1.to_i + valor2.to_i
end

Então(/^o resultado é (\d+)$/) do |resultado|
  expect(@soma).to eql resultado.to_i
end