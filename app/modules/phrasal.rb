require 'phrasal/dictionary'
require 'phrasal/generator'

module Phrasal
  def self.generate *args
    Generator.new(*args).generate
  end

  def self.permutations *args
    Generator.new(*args).permutations
  end
end
