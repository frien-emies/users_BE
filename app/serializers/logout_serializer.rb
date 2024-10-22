class LogoutSerializer
  def self.logout_json(user)
    {
      "data": {
        "type": "user",
        "id": user.id,
        "attributes": {
          "message": "User successfully logged out."
        }
      }
    }
  end
end