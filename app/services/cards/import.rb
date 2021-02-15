# This class fetches cards from Pokemon API and inserts them cards in the db

class Cards::Import
  # Base URL for pokemon API

  BASE_URL = 'https://api.pokemontcg.io'

  ##
  # Get request to fetch pokemon cards
  #
  # Map through each card and builds an array
  #
  # Take this array of cards and bulk insert them to cards table in the database

  def process
    ::Card.insert_all(array_for_insert)
  end

  private

  def response
    @response ||= ::HTTParty.get("#{BASE_URL}#{api_query}")
  end

  def api_query
    '/v1/cards?setCode=base4'
  end

  def cards
    ::JSON.parse(response.body)['cards']
  end

  def array_for_insert
    cards.map do |c|
      {
        name: c['name'],
        image_url: c['imageUrl'],
        hp: c['hp'],
        rarity: c['rarity'],
        created_at: Time.current,
        updated_at: Time.current,
      }
    end
  end
end
