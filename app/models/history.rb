class History
  include Mongoid::Document
  field :message

  embedded_in :translation, :inverse_of => :histories
end
