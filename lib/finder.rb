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
      when collection[mid] > val then recursive_binary_search(val, low, mid-1)
      when collection[mid] < val then recursive_binary_search(val, mid+1, high)
      else mid
    end
  end

  def iterative_binary_search(value)
    low, high = 0, length - 1
    while low <= high
      mid = (low + high) / 2
      case
        when collection[mid] > value then high = mid - 1
        when collection[mid] < value then low = mid + 1
        else return mid
      end
    end
    nil
  end

  def iterative_search(value)
    collection.each_with_index do |element, index|
      return index if element == value
    end
    nil
  end

  def recursive_search(value, index=0)
    return if index > length - 1

    return index if collection[index] == value
    recursive_search(value, index + 1)
  end

  private

  def length
    @length ||= collection.size
  end
end
