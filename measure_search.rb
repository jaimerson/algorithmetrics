require 'benchmark'
require_relative 'lib/finder'

module Ruler
  extend self

  def measure(message = nil, iterations, &block)
    puts "#{message}:\n\n"

    Benchmark.bm do |bm|
      bm.report { iterations.times { block.call } }
    end
  end
end

collection = (1..500).to_a

finder = Finder.new(collection)

%i(recursive_binary_search iterative_binary_search iterative_search).each do |search|
  Ruler.measure(search, 100_000) do
    finder.public_send(search, rand(1..500))
  end
end
