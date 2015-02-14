class Finder
  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  # Binary search algorithms from
  # http://rosettacode.org/wiki/Binary_search#Ruby

  def recursive_binary_search(val, low=0, high=(length - 1))
    return nil if high < low
    mid = (low + high) / 2
    case
      when collection[mid] > val then binary_search(val, low, mid-1)
      when collection[mid] < val then binary_search(val, mid+1, high)
      else mid
    end
  end

  def iterative_binary_search(value)
    low, high = 0, length - 1
    while low <= high
      mid = (low + high) / 2
      case
        when collection[mid] > val then high = mid - 1
        when collection[mid] < val then low = mid + 1
        else return mid
      end
    end
    nil
  end

  def iterative_search(value)
    collection.each do |element|
      return element if element == value
    end
    nil
  end
end
