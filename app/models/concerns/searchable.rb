module Searchable
  extend ActiveSupport::Concern
  SEPARATORS =
      [" ", "\n", "\t", ".", ",", ";", ":", "\\(", "\\)", "\\[", "\\]", '\'', '"', '\\?', '\\!', "<", ">"].freeze

  included do
    has_many :keywords, as: :document, dependent: :destroy
    after_save :update_keywords
  end

  module ClassMethods

    def split(string)
      string.split(Regexp.new("[#{SEPARATORS.join}]+"))
    end

    def stem(word)
      Lingua.stemmer(word).downcase
    end

    def query_to_search(query)
      final = []
      split(query).each do |word|
        final << stem(word).downcase
      end
      return final
    end

    def is_searchable(column)
      table_name = self.table_name
      klass = self
      define_method(:update_keywords) do
        keywords.destroy_all
        klass.split(self.send(column)).each do |word|
          keywords.create!(main_word: word, matched_word: klass.stem(word))
        end
      end

      define_singleton_method(:search) do |query_string|
        joins(:keywords).where(keywords: {matched_word: query_to_search(query_string)}).select("COUNT(keywords.id) as count, #{table_name}.*, ARRAY_AGG(keywords.main_word) as highlights").group("#{table_name}.id").order('count desc')
      end
    end
  end
end