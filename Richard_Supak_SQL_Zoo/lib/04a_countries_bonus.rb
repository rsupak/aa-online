# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE gdp >= ALL(
      SELECT
        gdp
      FROM
        countries
      WHERE
        gdp >= 0 AND
        continent = 'Europe'
    ) AND continent != 'Europe'
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT
      continent, name, area
    FROM
      countries x
    WHERE
      area >= ALL(
        SELECT
          area
        FROM
          countries y
        WHERE y.continent = x.continent
          AND area > 0
      )

  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    SELECT
      name, continent
    FROM
      countries x
    WHERE
      population > ALL(
        SELECT
          population * 3
        FROM
          countries y
        WHERE
          x.continent = y.continent
          AND population > 0
          AND y.name != x.name
      )
  SQL
end
