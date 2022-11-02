require "artist_repository"

def reset_artists_table
    seed_sql = File.read('./spec/seeds_album.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
#Tests

RSpec.describe "ArtistRepository" do
    describe ArtistRepository do
      before(:each) do 
        reset_artists_table
      end

    it "returns all artists" do
        repo = ArtistRepository.new

        artists = repo.all
        expect(artists.length).to eq 3  

        expect(artists[0].id.to_i).to eq 1  
        expect(artists[0].name).to eq "Pixies"  
        expect(artists[0].genre).to eq "Rock"   
        
        expect(artists[1].id.to_i).to eq 2  
        expect(artists[1].name).to eq "The 1975"  
        expect(artists[1].genre).to eq "Rock"
    end
end
end