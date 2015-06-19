require 'mixpanel_stats'

module Lita
  module Handlers
    class Mixpanel < Handler

      def self.default_config(config)
        config.api_key = nil
        config.api_secret = nil
        config.funnels = nil
      end

      route %r{(mixpanel)}i,
        :funnels_stats,
        command: true,
        help: {
          "mixpanel funnels" => "gets recent funnels performance from mixpanel"}

      def funnels_stats(response)
        (funnels || []).each do |id, name|
          funnel_stats = generate_funnel_stats(id)
          msg = "Funnel performance for: #{name}\n"
          msg << funnel_stats
          response.reply "/code " + msg
        end
      end

      def generate_funnel_stats(funnel_id)
        to = Date.today
        from = Date.today - 7
        mixpanel.funnel_chart(funnel_id, from, to)
      end

      def mixpanel
        @mixpanel ||= MixpanelStats.new(
          Lita.config.handlers.mixpanel.api_key,
          Lita.config.handlers.mixpanel.api_secret,
        )
      end

      def funnels
        Lita.config.handlers.mixpanel.funnels
      end

    end

    Lita.register_handler(Mixpanel)
  end
end
