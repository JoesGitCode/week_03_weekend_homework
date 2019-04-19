require_relative('../db/sql_runner.rb')

class Ticket

  attr_accessor :customers_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customers_id = options['customers_id']
    @film_id = options['film_id']

  end

end
