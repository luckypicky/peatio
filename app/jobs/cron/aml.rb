module Jobs
  module Cron
    class AML
      def self.process
        Deposit.aml_processing.each do |d|
          result = Peatio::AML.get_info(d)
          if result.risk_detected
            d.aml_suspicious!
          elsif result.risk_detected == false
            d.process!
          end
        end
        sleep 60
      end
    end
  end
end
