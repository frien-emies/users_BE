class NoMatchFoundSerializer 
  def self.no_match
    {
    "error": {
        "message": "No usernames match the search criteria.",
        "status": 204
      }
    }
  end
end