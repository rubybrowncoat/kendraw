class SharedBoard < ApplicationRecord
  before_validation :generate_url, on: :create

  validates :url, presence: true, uniqueness: true

  has_many :shared_actives, dependent: :destroy

  private

  def generate_url
    loop do
      self.url = Phrasal.generate

      puts url
      break unless self.class.exists?(url: url)
    end
  end
end
