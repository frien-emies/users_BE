class UserSerializer 
  include JSONAPI::Serializer

  set_id :id
  set_type :user
  attributes :username, :email, :avatar


  def self.index_json(users)
    {
      "data": users.map do |user|
        {
          "type": "user",
          "id": user.id,
          "attributes": {
            "username": user.username,
            "email": user.email,
            "avatar": user.avatar
          }
        }
      end
    }
  end
end