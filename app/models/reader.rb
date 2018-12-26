class Reader < ApplicationRecord
  has_and_belongs_to_many :books

  validates :first_name, :second_name, :patronymic, :home_address, :work_address, :phone, :passport,
            presence: true, length: { minimum: 3, maximum: 50 }

  validates :born_on, presence: true

  def full_name
    "#{second_name} #{first_name} #{patronymic}"
  end
end
