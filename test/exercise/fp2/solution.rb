module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        index = 0

        while index < length
          yield self[index]
          index += 1
        end

        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new

        my_each do |el|
          result.push(yield el)
        end

        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new

        my_each do |el|
          result.push(el) unless el.nil?
        end

        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil)
        acc = self[0]

        slice(1..(length - 1)).my_each do |el|
          acc = yield acc, el
        end

        init.nil? ? acc : yield(init, acc)
      end
    end
  end
end
