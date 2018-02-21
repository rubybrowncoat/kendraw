class SavedBoard < ApplicationRecord
  before_create :generate_url

  validates :content, presence: true, uniqueness: true
  
  private

  def generate_url
    begin
      self.url = TokenPhrase.generate
    end while self.class.exists?(url: url)
  end
end