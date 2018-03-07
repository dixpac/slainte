require "test_helper"

class InviterTest < Minitest::Test
  def test_run_outputs_list_of_mathcing_customers_to_terminal
    path =  File.expand_path("../fixtures/files/customers.json", __FILE__)
    byebug
    inviter = Slainte::Inviter.run(path: path)
  end
end
