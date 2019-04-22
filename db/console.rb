require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

require('pry')
#
# Customer.delete_all()
# Film.delete_all()
# Ticket.delete_all()

customer1 = Customer.new({"name" => "Dvon Dudley", "funds" => 100})
customer2 = Customer.new({"name" => "Bubba Ray Dudley", "funds" => 50})
customer3 = Customer.new({"name" => "Spike Dudley", "funds" => 1})
customer4 = Customer.new({"name" => "Stacey Keibler", "funds" => 500})
customer1.save()
customer2.save()
customer3.save()
customer4.save()
# customer1.funds = 200
# customer1.update()

film1 = Film.new({"title" => "Lost in Translation", "price" => 50})
film2 = Film.new({"title" => "There Will Be Blood", "price" => 40})
film1.save()
film2.save()
# film1.price = 25
# film1.update()
# film1.delete_by_id(15)

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
ticket2 = Ticket.new({"customer_id" => customer2.id, "film_id" => film1.id})
ticket3 = Ticket.new({"customer_id" => customer3.id, "film_id" => film1.id})
ticket4 = Ticket.new({"customer_id" => customer4.id, "film_id" => film1.id})
ticket5 = Ticket.new({"customer_id" => customer1.id, "film_id" => film2.id})
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
# ticket1.customer_id = 5
# ticket1.update()

Ticket.select_all()
Customer.select_all()
Film.select_all()

film1.display_customers()
p customer1.display_films()







binding.pry
nil
