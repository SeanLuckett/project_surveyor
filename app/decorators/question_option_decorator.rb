class QuestionOptionDecorator < SimpleDelegator
  ALPHABET = ('a'..'z').to_a.freeze

  def text(index)
    prefix = ALPHABET[index]
    "#{prefix}. #{body}"
  end
end