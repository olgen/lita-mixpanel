require 'mixpanel_client'

class MixpanelStats
  def initialize(key, secret)
    @key, @secret = key, secret
  end

  def funnel_chart(funnel_id, from, to)
    chart_data = funnel_data(funnel_id, from, to)
    chart = FunnelChart.new(chart_data)
    chart.to_s
  end
  protected

  def funnel_data(funnel_id, from, to)
    from = from.iso8601 if from.is_a?(Date)
    to = to.iso8601 if to.is_a?(Date)

    client.request("funnels/",
                   funnel_id: funnel_id,
                   from_date: from,
                   to_date: to,
                  )
  end

  def client
    @client ||= Mixpanel::Client.new(
      api_key: @key,
      api_secret: @secret
    )
  end
end

class FunnelChart

  # data example:
  # {"meta"=>{"dates"=>["2015-05-17"]},
  #  "data"=>{
  #   "2015-05-17"=>
  # {"steps"=>[
  #   {"count"=>579,
  #    "step_conv_ratio"=>1,
  #    "goal"=>"Landing page view",
  #    "overall_conv_ratio"=>1,
  #    "avg_time"=>nil,
  #    "event"=>"Landing page view"},
  #    {"count"=>9,
  #     "step_conv_ratio"=>0.015544041450777202,
  #     "goal"=>"Download page view",
  #     "overall_conv_ratio"=>0.015544041450777202,
  #     "avg_time"=>211, "event"=>"Download page view"
  # }
  # ],
  #   "analysis"=>{
  #   "completion"=>9,
  #   "starting_amount"=>579,
  #   "steps"=>2,
  #   "worst"=>1}
  # }}}
  def initialize(mixpanel_data)
    @dates = mixpanel_data['meta']['dates']
    @data = mixpanel_data['data']
  end

  def to_s
    parts = @dates.map do |date|
      date_stats(date)
    end
    parts.join("\n")
  end

  def date_stats(date)
    stats = @data[date]
    analysis = stats['analysis']
    start = analysis['starting_amount']
    completion = analysis['completion']
    cr = completion.to_f / start.to_f
    line = "#{date} CR=#{percent(cr)}     #{completion}/#{start}"
    line << " <- today" if date == Date.today.iso8601
    line
  end

  def percent(float)
    "%.2f%" %  (float * 100)
  end

end
