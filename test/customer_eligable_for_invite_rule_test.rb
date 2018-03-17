require "test_helper"

module Slainte
  class CustomerEligableForInviteRuleTest < Minitest::Test
    def test_satisfied_returns_true_inside_300_kilometers
      rule = Slainte::CustomerEligableForInviteRule.new(customer: dino, distance: 300, from: dublin_office)
      assert rule.satisfied?
    end

    def test_satisfied_returns_false_inside_1_kilometer
      rule = Slainte::CustomerEligableForInviteRule.new(customer: dino, distance: 1, from: dublin_office)
      refute rule.satisfied?
    end

    def dino
      @_dino ||= Customer.new("1", "Dino Maric", 52.986375, -6.043701)
    end

    def dublin_office
      @_dublin_office ||= { latitude: 53.339428, longitude: -6.257664 }
    end
  end
end
