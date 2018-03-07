module Slainte
  class TerminalPresenter
    attr_accessor :customers

    def initialize(customers)
      @customers = customers
    end

    def render
      puts customers.each { |customer| customer.to_s }
    end
  end
end
