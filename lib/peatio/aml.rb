# frozen_string_literal: true

module Peatio
  module AML
    class << self
      attr :adapter

      def set_adapter(adapter)
        @adapter = adapter
      end

      def check(deposit)
        @adapter.check(deposit)
      end

    end
    class Dummy
      def check(deposit)
        deposit.process!
      end
    end
  end
end
