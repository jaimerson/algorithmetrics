require 'benchmark'
require 'gruff'
require_relative 'lib/finder'

module Ruler
  extend self
  ITERATIONS = 100_000

  def measure(search, size)
    range = (1..size)
    collection = range.to_a
    finder = Finder.new(collection)
    Benchmark.realtime { finder.public_send(search, rand(range)) }
  end
end



methods = %i(recursive_binary_search iterative_binary_search
             iterative_search)
labels = { 0 => '10_000', 1 => '100_000', 2 => '1_000_000', 3 => '10_000_000',
           4 => '100_000_000' }

graph = Gruff::Line.new
graph.title = 'Such search much algorithm very wow'
graph.labels = labels
graph.x_axis_label = 'Array size'
graph.y_axis_label = 'Time in seconds'
graph.marker_font_size = 14
graph.hide_dots = true
graph.line_width = 3

methods.each do |search|
  values = labels.values.map { |v| Ruler.measure(search, v.to_i) }
  puts values.inspect
  graph.data(search, values)
end

graph.write('binary_vs_iterative_search.png')
