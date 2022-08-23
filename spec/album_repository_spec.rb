require "album_repository"

def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  describe AlbumRepository do
    before(:each) do 
      reset_albums_table
    end
end
#Tests

RSpec.describe "AlbumRepository" do
    it "returns all albums" do
        repo = AlbumRepository.new

        albums = repo.all
        expect(albums.length).to eq 12  

        expect(albums[0].id).to eq '1'  
        expect(albums[0].title).to eq "Doolittle"  
        expect(albums[0].artist_id).to eq '1'    
        
        expect(albums[1].id).to eq '2'  
        expect(albums[1].title).to eq "Surfer Rosa"  
        expect(albums[1].artist_id).to eq '1'
    end
    
    # it "returns a single album" do
    #     repo = AlbumRepository.new

    #     album = repo.find(1)
        
    #     expect(album.id).to eq 2
    #     expect(album.title).to eq "Surfer Rosa"  
    #     expect(album.artist_id).to eq 1 
    # end

    # it "creates a new album" do
    #     repo = AlbumRepository.new
        
    #     new_album = repo.create('Pinkprint', 2011, 4)
        
    #     expect(new_album.id).to eq 13  
    #     expect(new_album.title).to eq "Pinkprint" 
    #     expect(new_album.artist_id).to eq 4 
    # end

    # it "updates an existing album" do
    #     repo = AlbumRepository.new
        
    #     updated_album = repo.update(Pinkprint, Blueprint, 4)
  
    #     expect(updated_album.title).to eq "Blueprint" 

    # end
    
    # it "deletes an album" do
    #     repo = AlbumRepository.new
        
    #     deleted_album = repo.delete(4)
        
    #     expect{deleted_album.id}.to raise_error "Album does not exist" 
    #     expect{deleted_album.title}.to raise_error "Album does not exist"
    #     expect{deleted_album.artist_id}.to raise_error "Album does not exist"
    # end

end 