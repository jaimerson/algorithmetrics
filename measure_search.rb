require 'benchmark'
require_relative 'lib/finder'

module Ruler
  extend self

  def measure(message = nil, iterations, &block)
    puts message

    puts (Benchmark.measure do
      iterations.times do
        block.call
      end
    end)

    puts '----------------'
  end
end

collection = (1..500).to_a

finder = Finder.new(collection)

%i(recursive_binary_search iterative_binary_search iterative_search).each do |search|
  Ruler.measure("Measuring #{search} 100_000 times:", 100_000) do
    finder.public_send(search, rand(1..500))
  end
end
