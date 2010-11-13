class Authentication
  include Mongoid::Document
  field :user_id, :type => Integer
  field :provider
  field :uid
  referenced_in :user
end
