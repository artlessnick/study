module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        recursive_yield = lambda { |array|
          unless array.empty?
            yield array[0]
            recursive_yield.call array[1..-1]
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
        acc = init.nil? ? self[0] : init

        recursive_yield = lambda { |array|
          unless array.empty?
            acc = yield acc, array[0]
            recursive_yield.call array[1..-1]
          end
        }

        if init.nil?
          recursive_yield.call self[1..-1]
        else
          recursive_yield.call self
        end

        acc
      end
    end
  end
end
