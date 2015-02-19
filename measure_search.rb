require 'benchmark'
require_relative 'lib/finder'

module Ruler
  extend self

  def measure(message, iterations, &block)
    time = Benchmark.realtime { iterations.times { block.call } }
    puts "#{message}: #{time} seconds"
  end
end

collection = (1..500).to_a

finder = Finder.new(collection)

methods = %i(recursive_binary_search iterative_binary_search
             recursive_search iterative_search)

methods.each do |search|
  Ruler.measure(search, 100_000) do
    finder.public_send(search, rand(1..500))
  end
end
