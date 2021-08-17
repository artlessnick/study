module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        new_array = array.select do |el|
          !el['country'].nil? && el['country'].split(',').length > 1 && !el['rating_kinopoisk'].nil? && el['rating_kinopoisk'].to_f != 0
        end

        new_array.map { |el| el['rating_kinopoisk'].to_f }.reduce(:+) / new_array.length
      end

      def chars_count(films, threshold)
        array = films.select { |el| el['rating_kinopoisk'].to_f >= threshold }

        result_map = array.map { |el| el['name'] }

        result_map.reduce(0) { |sum, n| n.count('и') != 0 ? sum + n.count('и') : sum }
      end
    end
  end
end
