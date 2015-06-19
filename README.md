# lita-mixpanel

**lita-mixpanel** is a handler for [Lita](https://github.com/jimmycuadra/lita) that provides current KPI information from mixpanel

## Installation

Add lita-mixpanel to your Lita instance's Gemfile:

``` ruby
gem "lita-mixpanel"
```


## Configuration

This plugin requires a working mixpanel account & api_key & api_secret:

``` ruby
  config.handlers.mixpanel.api_key = 'MIXPANEL_API_KEY'
  config.handlers.mixpanel.api_secret = 'MIXPANEL_API_SECRET'
  config.handlers.mixpanel.funnels = {
    "funnel_id" =>"funnel name",
  }
```

## Usage

```
Lita: mixpanel funnels
```

## License

[MIT](http://opensource.org/licenses/MIT)
