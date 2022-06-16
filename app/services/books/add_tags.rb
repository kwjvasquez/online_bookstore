# frozen_string_literal: true

module Books
  class AddTags
    def initialize(book:, tags:)
      @book = book
      @tags = tags
    end

    def call
      @book.tag_list.add(@tags, parse: true)
      @book.save
    end
  end
end
