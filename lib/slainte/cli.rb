require "thor"

module Slainte
  # Simple CLI wrapper for Slainte usage.
  class Cli < Thor
    desc "invite -p '/path/customers.json' -d 50", "Outputs customers to invite"
    method_option :path, type: :string, required: true, aliases: "-p", banner: "Path to the customers file"
    method_option :distance, type: :numeric, default: 100, aliases: "-d", banner: "Filtering distance"
    def invite
      path = options[:path]
      distance = options[:distance]

      inviter = Slainte::Inviter.new(path: path, distance: distance)
      inviter.run presenter: Slainte::TerminalPresenter
    end
  end
end
