json.extract! book, :id, :title, :author, :published_on, :publisher, :decommissioned_at, :decommissioned_reason, :number_of_pages, :created_at, :updated_at
json.url book_url(book, format: :json)
