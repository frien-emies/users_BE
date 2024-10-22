class LoginSerializer
  def self.login_json(user)
    {
      "data": {
        "type": "user",
        "id": user.id,
        "attributes": {
          "email": user.email,
          "username": user.username,
          "avatar": user.avatar
        }
      }
    }
  end
end