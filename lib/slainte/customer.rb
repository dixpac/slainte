module Slainte
  class Customer
    attr_reader :user_id, :name, :latitude, :longitude

    def initialize(user_id, name, latitude, longitude)
      @user_id = user_id
      @name = name
      @longitude = longitude
      @latitude = latitude
    end

    def <=>(other_customer)
      user_id <=> other_customer.user_id
    end

    def ==(other_customer)
      user_id == other_customer.user_id
    end
    alias :eql? :==

    def hash
      [ @user_id, @name, @latitude, @longitude ].hash
    end

    def to_s
      "User ID: #{user_id}, Name: #{name}\n"
    end
  end
end
