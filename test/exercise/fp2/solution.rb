module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        recursive_yield = lambda { |array|
          unless array.empty?
            first, *others = array
            yield first
            recursive_yield.call others
          end
        }

        recursive_yield.call self
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) do |result, el|
          result.push(yield el)
          result
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |result, el|
          result.push(el) unless el.nil?
          result
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil)
        first, *others = self

        acc = init.nil? ? first : init

        recursive_yield = lambda { |array|
          return if array.empty?

          ar_first, *ar_others = array
          acc = yield acc, ar_first
          recursive_yield.call ar_others
        }

        if init.nil?
          recursive_yield.call others
        else
          recursive_yield.call self
        end

        acc
      end
    end
  end
end
