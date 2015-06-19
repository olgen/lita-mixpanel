module Lita
  module Handlers
    class Mixpanel < Handler

      def self.default_config(config)
        config.api_key = nil
        config.api_secret = nil
        config.funnels = []
      end

      route %r{(mixpanel funnels)}i,
        :funnels,
        command: true,
        help: {
          "mixpanel funnels" => "gets recent funnels performance from mixpanel"}

      def funnels(response)
        response.reply "Configured funnels: #{funnel_ids}"
      end

      def funnel_ids
        Lita.config.handlers.mixpanel.funnels
      end

    end

    Lita.register_handler(Mixpanel)
  end
end
