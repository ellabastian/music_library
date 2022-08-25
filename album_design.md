{{Albums}} Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Design and create the Table
If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO albums (title, release_year) VALUES ('Born this way', 'April 2012');
INSERT INTO students (title, release_year) VALUES ('Best I ever had, 'May 2009');

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql

3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE
# Table name: albums

# Model class
# (in lib/album.rb)
class Album
end

# Repository class
# (in lib/album_repository.rb)
class AlbumRepository
end

4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: albums

# Model class
# (in lib/album.rb)

class Album

  # Replace the attributes by your own columns.
  attr_accessor :id, :title, :release_year, :artist_id
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,


5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class StudentRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students;

    # Returns an array of Student objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end


    #Takes album object in argument
    #Doesn't return anything
    def create(album)
        # INSERT INTO albums
        #     (title, release_year, artist_id)
        #     VALUES($1, $2, $3);
    end


    #Takes album object in argument
    #Doesn't return anything    
    def update(album)
        # UPDATE albums 
        # SET title = $1, release_year = $2, artist_id = $3
        # WHERE id = $3;
    end

    def delete(id)
        # DELETE FROM albums WHERE id = $1;
    end
end

6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all albums

repo = AlbumRepository.new

albums = repo.all

albums.length # =>  

albums[0].id # =>  
albums[0].name # =>  
albums[0].artist_id # =>  

albums[1].id # =>  
albums[1].name # =>  
albums[1].artist_id # =>  

# 2
# Get a single album

repo = AlbumRepository.new

album = repo.find(1)

album.id # =>  
album.name # =>  
album.artist_id # =>  

# 3
# Create a new album

repo = AlbumRepository.new

album = Album.new
album.name # => Pinkprint 
album.release_year =>
album.artist_id # => 4

repo.create(album) => nil

albums = repo.all

last_album = album.last
last_album.name =>
last_album.genre =>


# 4
# Update an album

repo = AlbumRepository.new

album = repo.find(1)

album.name = Born this way
album.release_year = 2012
album.artist_id = 1

repo.update(album)

updated_album = repo.find(1)

updated_album.name =>

# 5
# Delete an album

repo = AlbumRepository.new

album = repo.find(1)

repo.delete(album.id)

all_albums = repo.all
all_albums.length =>
all_albums.first.id => 2


7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/album_repository_spec.rb

def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'albums' })
    connection.exec(seed_sql)
  end
  
  describe AlbumRepository do
    before(:each) do 
      reset_albums_table
    end
  
    # (your tests will go here).
  end

8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.