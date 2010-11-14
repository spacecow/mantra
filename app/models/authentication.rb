class Authentication
  include Mongoid::Document
  field :user_id, :type => Integer
  field :provider
  field :uid
  referenced_in :user

  def provider_name
    if provider == "open_id"
      "OpenID"
    else
      provider.titleize
    end
  end
end
