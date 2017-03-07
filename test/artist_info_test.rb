require File.expand_path('../test_helper', __FILE__)
require 'ostruct'

class ArtistInfoTest < Minitest::Test
  include ArtistInfo

  def setup
    @artist = OpenStruct.new(
      name: 'Rich Chigga', images: [{'height' => 330}],
      followers: {'total' => 12345},
      related_artists: [], external_urls: {'spotify' => 'a link'}
    )
    @track  = OpenStruct.new(name: 'Dat $tick')
  end

  def test_decorate_artist_data
    decorated_artist = {
      :name=>"Rich Chigga", :track=>"Dat $tick", :image_url=>nil, :popularity=>nil, :genres=>[], :followers=>12345, :related=>[], :spotify_link=>"a link"
    }
    artist = decorate_artist_data(@artist, @track)
    assert_equal decorated_artist, artist
  end
end
