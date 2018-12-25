class ReadersBooksController < ApplicationController
  before_action :set_readers_book, only: [:show, :edit, :update, :destroy]

  def index
    @readers_books = ReadersBook.all
  end

  def show
  end

  def new
    @readers_book = ReadersBook.new
  end

  def edit
  end

  def create
    @readers_book = ReadersBook.new(readers_book_params)

    respond_to do |format|
      if @readers_book.save
        format.html { redirect_to @readers_book }
        format.json { render :show, status: :created, location: @readers_book }
      else
        format.html { render :new }
        format.json { render json: @readers_book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @readers_book.update(readers_book_params)
        format.html { redirect_to @readers_book }
        format.json { render :show, status: :ok, location: @readers_book }
      else
        format.html { render :edit }
        format.json { render json: @readers_book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @readers_book.destroy
    respond_to do |format|
      format.html { redirect_to readers_books_url }
      format.json { head :no_content }
    end
  end

  private
  def set_readers_book
    @readers_book = ReadersBook.find(params[:id])
  end

  def readers_book_params
    params.require(:readers_book).permit(:reader_id, :book_id, :checked_out_at, :due_to_return_at, :returned_at)
  end
end
