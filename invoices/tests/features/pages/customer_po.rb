
class CustomerPage <SitePrism::Page
    set_url '/customers'

    section :nav, Sections::NavBar, '#navbar'

    element :new_button, '#dataview-insert-button'
    element :name, 'input[name=name]'
    element :phone, 'input[name=phone]'
    element :email, 'input[name=email]'
    element :type, 'select[id=costumer]'
    element :note, 'textarea[name=note]'
    element :save_button, 'button[id*=submit]'

    element :search_field, 'input[name=search]'
    element :search_button, '#dataview-search-button'
    element :search_alert, '.alert-warning'

    elements :view, 'table tbody tr'
    element :padre_kevedo, '#no_ekiziste'

    element :delete_yes, '.modal-content button[data-bb-handler=success]'

    def save(user)
        self.new_button.click
        self.name.set user.nome
        self.phone.set user.telefone
        self.email.set user.email
        self.type.find('option', text: user.tipo).select_option
        #self.type.all('option').sample.select_option
        self.note.set user.obs
        self.save_button.click
    end

    def search(value)
      self.search_field.set value
      self.search_button.click
    end

end