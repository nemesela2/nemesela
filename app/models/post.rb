class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :description

  def self.search(terms = '')
    where('description ilike ?', "%#{terms}%")
  end
end
