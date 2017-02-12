# sensu-mutator-graphite
[![Build Status](https://travis-ci.org/Kidinicol/sensu-mutator-graphite.svg?branch=master)](https://travis-ci.org/Kidinicol/sensu-mutator-graphite)


Using this mutator you can filter the check output metrics you want

Use handler with filter mutator
```json
{
  "handlers": {
    "graphite": {
      "type": "tcp",
      "mutator": "filter-mutator",
      "socket": {
        "host": "graphite.example.com",
        "port": 2003
      }
    }
  }
}
```
Add a json file with the filter-mutator
```json
{
  "mutators": {
    "filter-mutator": {
      "command": "/opt/sensu/embedded/bin/ruby /etc/sensu/mutators/filter-mutator.rb --listtoinclude /etc/sensu/mutators/metricstoinclude.json"
    }
  }
}
```
