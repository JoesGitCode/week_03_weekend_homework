require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :price, :title

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def delete_by_id(id)
    sql = "DELETE FROM films WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id =$3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.select_all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map { |film| Film.new(film) }
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def display_customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN
    tickets ON tickets.customer_id = customers.id
    WHERE film_id = $1"
    values = [@id]
    customers_data = SqlRunner.run(sql, values)
    return Customer.map_items(customers_data)
  end

  def self.map_items(data)
    result = data.map{|film| Film.new(film)}
    return result
  end



end
