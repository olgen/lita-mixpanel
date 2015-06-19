# lita-mixpanel

**lita-mixpanel** is a handler for [Lita](https://github.com/jimmycuadra/lita) that provides current KPI information from mixpanel

## Installation

Add lita-mixpanel to your Lita instance's Gemfile:

``` ruby
gem "lita-mixpanel"
```


## Configuration

This plugin requires a working mixpanel account & api_key & api_secret. FUNNEL_ID can be obtained from the mixpanel dashboard (see id url). FUNNEL_NAME is arbitrary and for display purpuses only.

``` ruby
  config.handlers.mixpanel.api_key = 'MIXPANEL_API_KEY'
  config.handlers.mixpanel.api_secret = 'MIXPANEL_API_SECRET'
  config.handlers.mixpanel.funnels = {
    "FUNNEL_ID" =>"FUNNEL_NAME",
  }
```

## Usage

```
Lita: mixpanel funnels

---
Funnel performance for: FUNNEL_NAME
2015-06-12 CR=2.26%   8/354
2015-06-13 CR=3.88%   19/490
2015-06-14 CR=2.61%   17/651
2015-06-15 CR=2.61%   21/804
2015-06-16 CR=4.58%   28/611
2015-06-17 CR=2.44%   11/450
2015-06-18 CR=4.49%   12/267
2015-06-19 CR=0.00%   0/13 <- today
--------------------
TOTAL      CR=3.19%   116/3640
```

## License

[MIT](http://opensource.org/licenses/MIT)
