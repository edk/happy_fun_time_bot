require 'httparty'
# Let's create a simple image getter from google.
class UrbanDictionary < ResponderType
  HelpText  = "Search UrbanDictionary for word"
  Command   = 'slang'
  
  include HTTParty
  format :json

  class << self      
    def get_term(from, search)
      names = ["brent", "andrew", "james", "carl", "cyn", "david", "eddy", "stephane", "priya", "dogan"]
      if names.include?(search.downcase)
        "(brent) asked me not to slang our names."
      else
        res = UrbanDictionary.get("http://www.urbandictionary.com/iphone/search/define?term=#{URI.escape(search)}")
        definition = res['list'].first['definition'] || 'No definition found.'
        "#{search}: #{definition}"
      end
    end
    
    alias :respond :get_term       
  end
end
