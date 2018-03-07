require "json"
require "ostruct"
require "set"
require "core_extensions"

require "slainte/version"
require "slainte/geo_calculator"
require "slainte/customers_parser"
require "slainte/customer"
require "slainte/customers"
require "slainte/presenters/terminal_presenter"
require "slainte/inviter"

module Slainte
  DUBLIN_OFFICE = { latitude: 53.339428, longitude: -6.257664 }
end
