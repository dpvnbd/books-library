class BookCategoryFilter
  attr_reader :relation, :category_id

  def initialize(relation, category_id)
    @category_id = category_id
    @relation = relation
  end

  def call
    return relation if category_id.blank?

    relation.left_joins(:categories).where('categories.id = ?', category_id)
  end
end