

module Sections
    class NavBar <SitePrism::Section
        element :user_menu, 'a[data-toggle=dropdown]'
        element :logout_link, 'a[href$=logout]'

        def logout
            self.user_menu.click
            self.logout_link.click
        end
    end
end
