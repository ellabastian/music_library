require "./lib/album"

class AlbumRepository
    def all
        sql = 'SELECT id, title, release_year, artist_id FROM albums;'
        result_set = DatabaseConnection.exec_params(sql, [])

        albums = []

        result_set.each do |record|
            album = Album.new

            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']
            album.artist_id = record['artist_id']

            albums << album
        end

        return albums

end 

    # def find(id)
    #     # SELECT * WHERE album_id = id
    # end

    # def create(album_name, album_release_year, album_artist_id)
    #     # INSERT INTO albums
    #     #     (title, release_year, artist_id)
    #     #     VALUES(album_name, album_release_year, album_artist_id)
    # end

    # def update(old_column_name, new_column_name)
    #     # UPDATE album 
    #     # SET column_name = new_column_name
    #     # WHERE id = 3
    # end

    # def delete(id)
    #     # DELETE FROM album WHERE id
    # end
end