class Bundle
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String

  embeds_many :flashcards
  embedded_in :user
end
