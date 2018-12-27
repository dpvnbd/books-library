class BooksController < BaseController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :save_filters, only: :index
  # GET /books
  # GET /books.json
  def index
    filtered_by_text = TextFilter.new(Book.all, filter_params).call
    filtered_by_published = DateRangeFilter.new(filtered_by_text, :published_on,
                                                filter_params).call
    @books = BookCategoryFilter.new(filtered_by_published, filter_params[:category_id]).call
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html {redirect_to @book, notice: 'Book was successfully created.'}
        format.json {render :show, status: :created, location: @book}
      else
        format.html {render :new}
        format.json {render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html {redirect_to @book, notice: 'Book was successfully updated.'}
        format.json {render :show, status: :ok, location: @book}
      else
        format.html {render :edit}
        format.json {render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html {redirect_to books_url, notice: 'Book was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :published_on, :publisher, :decommissioned_at, :decommissioned_reason, :number_of_pages, category_ids: [])
  end

  def filter_params
    filters = params.permit(filters: %i[title author published_on_from published_on_to publisher category_id])
    filters[:filters] || {}
  end

  def save_filters
    @filters = OpenStruct.new(filter_params)
  end
end
