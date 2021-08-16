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

      def search(_array, _query)
        0
      end
    end
  end
end
