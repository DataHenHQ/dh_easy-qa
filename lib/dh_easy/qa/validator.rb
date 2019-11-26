module DhEasy
  module Qa
    class Validator
      attr_reader :local_config, :data, :options, :errors

      def initialize(data=nil, options={})
        load_config
        @options = options
        @data = data
      end

      #this method is for validating "internal" scrapers that run on Datahen
      def validate_internal(vars, outputs)
        ValidateInternal.new(vars, config, outputs).run
      end

      #this method is for validating data from "external" sources
      def validate_external(outputs, collection_name)
        ValidateExternal.new(data, config, outputs, collection_name, options).run
      end

      # Configuration.
      #
      # @return [Hash]
      def config
        @config ||= local_config['qa']
      end

      # Configuration.
      #
      # @param [Hash] value Configuration.
      #
      # @return [Hash]
      def config=value
        @config = value
      end

      private

      def load_config
        @local_config ||= DhEasy::Config::Local.new
      end

      def config_path
        local_config.file_path
      end
    end
  end
end
