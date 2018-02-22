module Phrasal
  class Generator
    attr_accessor :separator, :dictionary, :order

    def initialize(separator = '-', options = {})
      if separator.is_a? Hash
        separator = '-'
        options = separator
      end

      options[:numbers] = [] if options[:numbers] == false

      @separator = separator
      @dictionary = Phrasal.dictionary.merge options
      @order = dictionary.keys
    end

    def generate
      lists.map(&:sample).join(separator).chomp(separator).gsub(/-/, separator)
    end

    def permutations
      lists.inject 1 do |p, list|
        if list.empty?
          p
        else
          p * list.uniq.count
        end
      end
    end

    def lists
      dictionary.values_at(*order).compact
    end
  end
end
