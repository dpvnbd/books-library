class Reader < ApplicationRecord
  has_and_belongs_to_many :books

  def full_name
    "#{second_name} #{first_name} #{patronymic}"
  end
end
