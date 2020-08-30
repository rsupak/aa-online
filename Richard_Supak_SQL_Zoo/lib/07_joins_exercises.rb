# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
    SELECT
      title
    FROM
      movies
    JOIN
      castings ON movies.id = movie_id
    JOIN
      actors ON actor_id = actors.id
    WHERE
      name = 'Harrison Ford'
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
  SELECT
    title
  FROM
    movies
  JOIN
    castings ON movies.id = movie_id
  JOIN
    actors ON actor_id = actors.id
  WHERE
    name = 'Harrison Ford' AND ord > 1
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
    SELECT
      title, name
    FROM
      movies
      JOIN castings ON (id = movie_id)
      JOIN actors ON (actors.id = actor_id)
      WHERE ord = 1 and yr = 1962
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
    SELECT
      yr, COUNT(title)
    FROM
      movies
      JOIN castings ON (movies.id = movie_id)
      JOIN actors ON (actor_id = actors.id)
    WHERE
      name = 'John Travolta'
    GROUP BY yr
    HAVING COUNT(title) = (SELECT
      MAX(c)
    FROM
      (SELECT
        yr, COUNT(title) AS c
      FROM
        movies
        JOIN castings ON movies.id = movie_id
        JOIN actors ON actor_id = actors.id
      WHERE
        name = 'John Travolta'
      GROUP BY
        yr) AS t)
  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
    SELECT
      title, name
    FROM
      movies
      JOIN castings ON (id = movie_id)
      JOIN actors ON (actors.id = actor_id)
    WHERE ord = 1 and movie_id IN
      (SELECT
        movie_id
      FROM
        castings y
        JOIN actors ON actors.id = actor_id
      WHERE name = 'Julie Andrews')
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
    SELECT DISTINCT name
    FROM actors
      JOIN castings ON (id = actor_id AND (SELECT COUNT(ord) FROM castings WHERE actor_id = actors.id AND ord = 1) >= 15)
    ORDER BY name
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
    SELECT title, COUNT(DISTINCT actor_id)
    FROM movies JOIN castings on id = movie_id
    WHERE yr = 1978
    GROUP BY movies.id
    order by COUNT(*) DESC, title ASC
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
    SELECT
      a1.name
    FROM (
      SELECT movies.*
      FROM movies
        JOIN castings ON castings.movie_id = movies.id
        JOIN actors ON actors.id = castings.actor_id
      WHERE name = 'Art Garfunkel'
    ) as m1
      JOIN (
        SELECT actors.*, castings.movie_id
        FROM actors
          JOIN castings ON castings.actor_id = actors.id
        WHERE actors.name != 'Art Garfunkel'
      ) as a1 ON m1.id = a1.movie_id
  SQL
end
