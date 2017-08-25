class GiphyAdapter

  include HTTParty

  base_uri 'api.giphy.com'
  # For the Giphy Adapter class, make the endpoint
  # equal to whatever is called with

  def initialize
    @api_key = ENV['GIPHY_API_KEY']
  end

  def search(search_string)
    response = self.class.get("/v1/gifs/search",
                   { query:
                     {
                       q: search_string,
                       api_key: @api_key
                     }
                   })

    response["data"].map { |result| result["images"]["fixed_height"]["url"] }
  end
end
