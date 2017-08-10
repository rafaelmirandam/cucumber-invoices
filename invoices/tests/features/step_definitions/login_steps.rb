#encoding: utf-8

Dado(/^acessa a página login$/) do
  login.load
end

Dado(/^que eu tenho um usuário:$/) do |table|
  @user = OpenStruct.new(table.rows_hash)
end

Dado(/^que eu tenho um usuário "([^"]*)"$/) do |perfil|
  @user = OpenStruct.new(DATA['users'][perfil])
end

Quando(/^faço login$/) do
  login.with(@user.email, @user.password)
end

Então(/^vejo o dashboard$/) do
  expect(dash.nav.user_menu.text).to eql @user.email
end

Então(/^a mensagem "([^"]*)"$/) do |message|
  expect(dash.title.text).to eql message
end

## Exceptions

Dado(/^que eu tenho o usuário "([^"]*)" e "([^"]*)"$/) do |email, senha|
  @user = OpenStruct.new(
      :email => email,
      :password => senha
  )
end

Então(/^vejo a mensagem "([^"]*)"$/) do |message|
  expect(login.alert.text).to include message
end