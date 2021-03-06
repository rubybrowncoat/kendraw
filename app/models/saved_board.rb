class SavedBoard < ApplicationRecord
  before_validation :generate_url, on: :create

  validates :content, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  private

  def generate_url
    loop do
      self.url = Phrasal.generate

      break unless self.class.exists?(url: url)
    end
  end
end
