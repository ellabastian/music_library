require "album_repository"

def reset_albums_table
    seed_sql = File.read('./spec/seeds_album.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
#Tests

RSpec.describe "AlbumRepository" do
    describe AlbumRepository do
      before(:each) do 
        reset_albums_table
      end

    it "returns all albums" do
        repo = AlbumRepository.new

        albums = repo.all
        expect(albums.length).to eq 3  

        expect(albums[0].id.to_i).to eq 1  
        expect(albums[0].title).to eq "Born this way"  
        expect(albums[0].artist_id.to_i).to eq 1    
        
        expect(albums[1].id.to_i).to eq 2  
        expect(albums[1].title).to eq "Best I ever had"  
        expect(albums[1].artist_id.to_i).to eq 1
    end
    
    it "returns a single album based on id" do
        repo = AlbumRepository.new

        albums = repo.find(1)
        
        # expect(album.id).to eq 2
        expect(albums.title).to eq "Born this way"  
        expect(albums.artist_id).to eq '1' 
    end

    it "creates a new album" do

        repo = AlbumRepository.new

        # new_album = Album.new
        # new_album.title = "Pinkprint" 
        # new_album.release_year = 2012
        # new_album.artist_id = 4

        # repo.create(new_album) 
        
        # albums = repo.all
        # last_album = albums.last
        
        # expect(last_album.title).to eq "Pinkprint" 
        # expect(last_album.release_year.to_i).to eq 2012
        # expect(last_album.artist_id.to_i).to eq 4

        new_album_1 = Album.new
        new_album_1.title = "Trompe le Monde" 
        new_album_1.release_year = 1991
        new_album_1.artist_id = 1

        repo.create(new_album_1) 
        
        albums = repo.all
        last_album_1 = albums.last
        
        expect(last_album_1.title).to eq "Trompe le Monde" 
        expect(last_album_1.release_year.to_i).to eq 1991
        expect(last_album_1.artist_id.to_i).to eq 1
    end

      it "deletes an album" do
        repo = AlbumRepository.new

        repo.delete(1)

        all_albums = repo.all
        expect(all_albums.length).to eq 2
        expect(all_albums.first.id.to_i).to eq 2
    end

    it "updates an existing album with new values" do
        repo = AlbumRepository.new

        album = repo.find(1)

        album.title = 'Not born this way'
        album.release_year = 2015
        album.artist_id = 2

        repo.update(album)

        updated_album = repo.find(1)

        expect(updated_album.title).to eq 'Not born this way'
        expect(updated_album.release_year.to_i).to eq 2015
        expect(updated_album.artist_id.to_i).to eq 2
    end   

    it "updates album title only" do
      repo = AlbumRepository.new

      album = repo.find(2)

      album.title = 'Not the best I ever had'

      repo.update(album)

      updated_album = repo.find(2)

      expect(updated_album.title).to eq 'Not the best I ever had'
      expect(updated_album.release_year.to_i).to eq 2009
      expect(updated_album.artist_id.to_i).to eq 1
  end   
end 
end