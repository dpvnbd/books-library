class BookCategoryReport
  attr_reader :relation, :from, :to

  def initialize(relation, from, to)
    @relation = relation
    @from = ActiveRecord::Base.connection.quote(from)
    @to = ActiveRecord::Base.connection.quote(to)
  end

  def call
    relation.joins("left join books_categories bc on categories.id = bc.category_id
       left join books b on bc.book_id = b.id
       left join readers_books rb on b.id = rb.book_id").group('categories.id')
        .select("categories.*,
       count(b.id) filter ( where b.created_at between #{from} and #{to})               as books_received,
       count(b.id) filter ( where b.decommissioned_at between #{from} and #{to})        as books_decommissioned,
       count(rb.id) filter ( where rb.checked_out_at between #{from} and #{to})         as books_checked_out,
       count(rb.id) filter ( where rb.returned_at between #{from} and #{to})            as books_returned,
       count(rb.id) filter ( where rb.returned_at between #{from} and #{to} and
                                   rb.returned_at > rb.due_to_return_at)            as books_returned_late,
       count(rb.id) filter ( where rb.returned_at is null or rb.returned_at > #{to} ) as books_not_returned")
  end
end