module Flexirest
  module KeepResponse
    attr_accessor :_raw_response
    module ClassMethods
      @@keep_response = true

      def keep_response(value = nil)
        @keep_response = nil unless instance_variable_defined?(:@keep_response)
        if value.nil?
          value = if @keep_response.nil?
            @@keep_response
          else
            @keep_response
          end
          if value.nil? && superclass.respond_to?(:keep_response)
            value = superclass.keep_response
          end
          value
        else
          @keep_response = value
        end
      end

      def keep_response=(value)
        @@keep_response = value
        @keep_response = value
      end

    end
  end
end
