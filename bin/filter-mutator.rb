#!/usr/bin/env ruby
# DESCRIPTION:
# This mutator filters the check output of each event
# and keeps only the ones that have partial contain included in the json file
#
# OUTPUT:
# filtered
# @event['check']['output']
#
# DEPENDENCIES:
#   gem: sensu-mutator
#
# LICENSE:
#  Copyright 2017 Nikoletta Kyriakidou & Hyane Moussassa (https://github.com/Kidinicol/sensu-mutator-graphite.git)
#  Released under the same terms as Sensu (the MIT license); see LICENSE
#  for details.
require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'json'
require 'sensu-mutator'
class MutatorGraphite < Sensu::Mutator
  option :listtoinclude,
         description: 'list of metrics to include',
         short: '-lti LISTTOINCLUDE',
         long: '--listtoinclude LISTTOINCLUDE',
         required: true

  def mutate
    metrics_to_include = []
    listfile = File.read(config[:listtoinclude])
    list = JSON.parse(listfile, symbolize_names: true)

    metrics_to_include = list[:metrics_to_include]

    all_metrics = @event['check']['output'].split("\n")

    mutated_metrics = []
    all_metrics.each do |metric|
      if should_metric_be_included(metrics_to_include, metric)
        mutated_metrics.push(metric)
      end
    end

    # Add a key/value pair to indicate that the event data has been mutated.
    @event[:mutated] = true
    @event['check']['output'] = mutated_metrics.join("\n")
  end

  def dump
    puts @event['check']['output']
  end

  def should_metric_be_included(metrics_to_include, metric)
    metrics_to_include.each do |metric_to_include|
      if metric.match(metric_to_include)
        return true
      end
    end
  end
end
