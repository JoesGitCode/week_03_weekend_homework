require_relative('../db/sql_runner.rb')

class Customer

attr_reader :id
attr_accessor :funds, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def delete_by_id(id)
    sql = "DELETE FROM customers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def display_films()
    sql = "SELECT films.* FROM films
    INNER JOIN
    tickets ON tickets.film_id = films.id
    WHERE films.id = $1;"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return Film.map_items(films)
  end

  def self.select_all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer) }
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|film| Film.new(film)}
    return result
  end


end
