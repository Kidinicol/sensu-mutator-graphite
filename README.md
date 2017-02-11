# sensu-mutator-graphite
Using this mutator you can filter the check output metrics you want

Use handler with filter mutator
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

Add a json file with the filter-mutator 

{
  "mutators": {
    "filter-mutator": {
      "command": "/opt/sensu/embedded/bin/ruby /etc/sensu/mutators/filter-mutator.rb --listtoinclude /etc/sensu/mutators/metricstoinclude.json"
    }
  }
}
