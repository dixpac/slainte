require "test_helper"

class CustomersTest < Minitest::Test
  def test_records_returns_sorted_set_of_customers
    input = read_file "customers.json"
    records_hash = Slainte::CustomersParser.run input

    records = Slainte::Customers.new(records_hash).records

    assert_equal 32, records.size
    assert_instance_of SortedSet, records
  end

  def test_records_are_sorted_by_user_id
    input = read_file "customers.json"
    records_hash = Slainte::CustomersParser.run input

    records = Slainte::Customers.new(records_hash).records
    sorted_records = records.sort_by { |r| r.user_id }

    assert_equal sorted_records.to_a, records.to_a
  end

  def test_records_returns_only_unique_customers
    input = read_file "customers_with_duplicates.json"
    records_hash = Slainte::CustomersParser.run input

    customers = Slainte::Customers.new records_hash

    assert_equal 1, customers.records.size
  end

  def test_within_returns_all_customers_withn_100_km_from_dublin_office
    input = read_file "customers.json"
    records_hash = Slainte::CustomersParser.run input
    customers = Slainte::Customers.new records_hash

    matches = customers.within_distance of: 100

    assert_equal 15, matches.size
  end
end
