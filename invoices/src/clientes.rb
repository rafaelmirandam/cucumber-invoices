require 'faker'
require 'ostruct'

class Customer
    def get_customer
        name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
        ddds = ['11','15','31']
        tipos = ['Gold', 'Prime']

        @new_customer = OpenStruct.new(
            :nome => name,
            :telefone => "#{ddds.sample} 9#{Faker::Number.number(8)}",
            :email => Faker::Internet.free_email(name),
            :tipo => tipos.sample,
            :obs => Faker::Lorem.paragraph
        )
    end
end

@customer = Customer.new
@users = Array.new

@quantity = (0...10)

@quantity.each do |i|
    @users.push(@customer.get_customer)
end

@users.each do |u|
    puts "#{u.email} - #{u.tipo}"
end