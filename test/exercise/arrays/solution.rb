module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0

        array.each do |el|
          el > max ? max = el : max
        end

        array.map! { |el| el.positive? ? max : el }
      end

      def search(array, query)
        return -1 if array.length.zero? || array.length == 1 && array[0] != query

        middle = (array.length - 1) / 2

        return middle if query == array[middle]

        if query > array[middle]
          new_middle = search(array.slice((middle + 1)..(array.length - 1)), query).to_i
          new_middle == -1 ? -1 : middle + 1 + new_middle
        else
          search(array.slice(0..(middle - 1)), query)
        end
      end
    end
  end
end
