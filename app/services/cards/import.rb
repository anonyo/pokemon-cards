class Cards::Import
  BASE_URL = 'https://api.pokemontcg.io'

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
