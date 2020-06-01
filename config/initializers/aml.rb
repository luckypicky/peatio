# frozen_string_literal: true
require 'peatio/aml'

begin
  if ENV['AML_BACKEND'].present?
    "Peatio::AML::#{ENV.fetch('AML_BACKEND').capitalize}".constantize.new
  else
    Peatio::AML.set_adapter(Peatio::AML::Dummy.new)
  end
rescue StandardError
  Peatio::AML.set_adapter(Peatio::AML::Dummy.new)
end
