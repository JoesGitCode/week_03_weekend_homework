require_relative('../db/sql_runner.rb')

class Customer

attr_reader :name
attr_accessor :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = otions['funds']
  end
end
