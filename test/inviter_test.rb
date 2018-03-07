require "test_helper"

class InviterTest < Minitest::Test
  class TestArrayPresenter
    attr_accessor :customers

    def initialize(customers)
      @customers = customers
    end

    def render
      customers.to_a
    end
  end

  def test_run_raises_exception_on_invalid_file_path
    assert_raises Errno::ENOENT do
      Slainte::Inviter.new(path: "invalid").run
    end
  end

  def test_run_presents_result_based_on_specified_presenter
    path =  File.expand_path("../fixtures/files/customers.json", __FILE__)
    inviter = Slainte::Inviter.new(path: path)

    output = inviter.run(presenter: TestArrayPresenter)

    assert_instance_of Array, output
    assert_equal 15, output.size
  end
end
