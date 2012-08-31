class Flashcard
  include Mongoid::Document
  field :question, :type => String
  field :answer, :type => String

  embedded_in :bundle
end
