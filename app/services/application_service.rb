# frozen_string_literal: true

# Interface for helpers methods of services
class ApplicationService
  def initialize(...); end

  def self.call(...)
    new(...).call
  end
end
