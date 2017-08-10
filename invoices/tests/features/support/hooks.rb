
# Before do
#     @login = LoginPage.new
#     @dash = DashPage.new
#     @customer = CustomerPage.new
# end

Before('@customer_page') do
    email = DATA['users']['admin']['email']
    password = DATA['users']['admin']['password']
    login.load
    login.with(email, password)
    dash.wait_for_title
    customer.load
    # verificar se o elemento não é exibido na pagina 
    expect(customer.has_no_padre_kevedo?).to be true
end

After('@clean_customer_db') do
    ## implementar exclusão do registro no banco

    ## Etapa 1 - Voltar Backup (Golden Backup)
        #=> Colocar banco de dado no estado inicial
    ## Etapa 2 - Executo todos os cenários
    ## Etapa 3 - Analise dos problemas encontrados + report dos testes
    ## Etapa 4 - Nova versão
end

After('@logout') do
    dash.nav.logout
    login.load
end

After do |scenario|

    @name = scenario.name.gsub(' ', '_')
    #results/shots/tentativa_de_login,_exemplos_(#1).png
    @name = @name.gsub(',', '')
    @name = @name.gsub('#', '')
    @name = @name.gsub('(', '')
    @name = @name.gsub(')', '')

    @target = "results/shots/#{@name.downcase!}.png"

    # if scenario.failed?
        page.save_screenshot(@target)
        embed(@target, 'image/png', 'Clique aqui para ver a evidência')    
    # end

    # if BROWSER.eql?('headless')
    #     Capybara.current_session.driver.quit
    # end
end

