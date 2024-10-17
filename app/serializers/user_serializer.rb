class UserSerializer 
  include JSONAPI::Serializer

  set_id :id
  set_type :user
  attributes :username, :email, :avatar
end