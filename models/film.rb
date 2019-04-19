require_relative('../db/sql_runner.rb')

class Film

  attr_reader :title
  attr_accessor :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']

  end

end
