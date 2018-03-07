require "test_helper"

class CustomersParserTest < Minitest::Test
  def test_parser_returns_array_of_customers_from_input
    input = read_file "customers.json"
    records_hash = Slainte::CustomersParser.run(input)

    assert_equal 32, records_hash.size
    assert_instance_of Array, records_hash
  end

  def test_parser_each_customet_record_is_converted_to_hash
    input = read_file "customers.json"
    records_hash = Slainte::CustomersParser.run(input)

    assert_instance_of Hash, records_hash.first
  end

  def test_parser_raises_is_input_is_not_present
    assert_raises ArgumentError do
      Slainte::CustomersParser.run("")
    end
    assert_raises ArgumentError do
      Slainte::CustomersParser.run
    end
  end

  def test_parser_raises_exception_on_invalid_json_format
    input = read_file "invalid_file.json"

    assert_raises JSON::ParserError do
      Slainte::CustomersParser.run(input)
    end
  end
end
