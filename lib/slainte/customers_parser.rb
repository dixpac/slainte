module Slainte
  # This class is responsible to parse input from file. Always returns Array of Hashes
  # and leaves futher manipulation to Customers class.
  class CustomersParser
    def self.run(input)
      raise ArgumentError, "Ooops....looks like input is empty!" if input.empty?

      sanitized_records = sanitize_input(input)
      records_hash_from sanitized_records
    end

    private
      def self.sanitize_input(input, new_line_chr = "\n")
        input.split(new_line_chr)
      end

      def self.records_hash_from(input)
        @_records = input.map { |record| parse_record(record) }
      end

      def self.parse_record(record)
        JSON.parse(record, symbolize_names: true)
      end
  end
end
