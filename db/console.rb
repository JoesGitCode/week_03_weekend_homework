require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

require('pry')

# Customer.delete_all()
# Film.delete_all()
# Ticket.delete_all()

customer1 = Customer.new({"name" => "Dvon Dudley", "funds" => 100})
customer2 = Customer.new({"name" => "Bubba Ray Dudley", "funds" => 50})
customer1.save()
customer1.funds = 200
customer1.update()

film1 = Film.new({"title" => "Lost in Translation", "price" => 50})
film1.save()
film1.price = 25
film1.update()
film1.delete_by_id(15)
#
# ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
# ticket1.customer_id = 5
# ticket1.update()





binding.pry
nil
