#encoding: utf-8

Dado(/^usuário logado acessa a página de clientes$/) do
    email = DATA['users']['admin']['email']
    password = DATA['users']['admin']['password']
    login.load
    login.with(email, password)
    dash.wait_for_title
    customer.load
    customer.wait_for_view
    # verificar se o elemento não é exibido na pagina 
    expect(customer.has_no_padre_kevedo?).to be true
end

Dado(/^que eu tenho novo cliente$/) do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  ddds = ['11','15','31']

  @user = OpenStruct.new(
        :nome => name,
        :telefone => "#{ddds.sample} 9#{Faker::Number.number(8)}",
        :email => Faker::Internet.free_email(name),
        :tipo => ['Gold', 'Prime', 'Exclusivo', 'Platinum'].sample,
        :obs => Faker::Lorem.paragraph
      )
end

Quando(/^faço o cadastro desse cliente$/) do
  customer.save(@user)
end

Então(/^vejo esse cliente na busca$/) do
  customer.search(@user.email)
  expect(customer.view.size).to eql 1
  expect(customer.view.first.text).to include @user.nome
  expect(customer.view.first.text).to include @user.telefone
  expect(customer.view.first.text).to include @user.email
end

Dado(/^que eu tenho uma lista de clientes$/) do
  tipos = ['Gold', 'Prime', 'Exclusivo', 'Platinum']
  #tipos = @customer.type.all('options')
  @users = Array.new

  tipos.each do |t|
    name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    ddds = ['11','15','31']

    @users.push(OpenStruct.new(
        :nome => name,
        :telefone => "#{ddds.sample} 9#{Faker::Number.number(8)}",
        :email => Faker::Internet.free_email(name),
        :tipo => t,
        :obs => Faker::Lorem.paragraph
      ))
  end
end

Quando(/^faço o cadastro desses clientes$/) do
  #@customer.save(@new_customer)
  @users.each do |u|
    customer.save(u)
  end
end

Então(/^vejo esses clientes na busca$/) do
  # @customer.search(@new_customer.email)
  # expect(@customer.view.size).to eql 1
  # expect(@customer.view.first.text).to include @new_customer.nome
  # expect(@customer.view.first.text).to include @new_customer.telefone
  # expect(@customer.view.first.text).to include @new_customer.email

  @users.each do |u|
    customer.search(u.email)
    expect(customer.view.size).to eql 1
    expect(customer.view.first.text).to include u.nome
    expect(customer.view.first.text).to include u.telefone
    expect(customer.view.first.text).to include u.email
  end
end

## Delete

Dado(/^que eu tenho um cliente$/) do
  steps %(
    Dado que eu tenho novo cliente
    Quando faço o cadastro desse cliente
    Então vejo esse cliente na busca
  )
end

Quando(/^faço a exclusão desse cliente$/) do
  customer.wait_for_view

  customer.view.first.find('span[class*=trash]').click
  customer.delete_yes.click

  # @customer.view.each do |line|
  #   if (line.text.include?(@email))
  #     line.find('span[class*=trash]').click
  #     @customer.delete_yes.click
  #   end
  # end
end

Então(/^esse cliente não deve ser exibido na busca$/) do
  #@customer.search(@email)
  customer.wait_for_search_alert
  expect(customer.search_alert.text).to eql "\"#{@user.email}\" não foi encontrado."
end