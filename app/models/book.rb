class Book < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :readers

  validates :title, :author, :publisher, presence: true, length: { minimum: 3, maximum: 50 }

  validates :number_of_pages, numericality: { greater_than_or_equal_to: 0, only_integer: true }, presence: true

  validates :published_on, presence: true
end
