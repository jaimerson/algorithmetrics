require 'spec_helper'
require 'finder'

RSpec.describe Finder do
  shared_examples 'a search algorithm' do
    let(:finder) { described_class.new(collection) }
    let(:collection) { [1, 2, 3, 5, 8, 13] }

    subject(:search) { ->(value) { finder.public_send(search_method, value) } }

    it "returns the element's index" do
      expect(search.(2)).to eq(1)
      expect(search.(5)).to eq(3)
    end
  end

  describe 'recursive binary search' do
    let(:search_method) { :recursive_binary_search }

    it_behaves_like 'a search algorithm'
  end

  describe 'iterative binary search' do
    let(:search_method) { :iterative_binary_search }

    it_behaves_like 'a search algorithm'
  end

  describe 'iterative search' do
    let(:search_method) { :iterative_search }

    it_behaves_like 'a search algorithm'
  end
end
