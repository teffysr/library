class BooksController < ApplicationController
  def index
    @books = Book.all
    if params[:author].present?
      @books = @books.where(author: params[:author])
    end
    if params[:title].present?
      @books = @books.where(title: params[:title])
    end
    if params[:editorial].present?
      @books = @books.where(editorial: params[:editorial])
    end
    if params[:available].present?
      @books = @books.where(available: params[:available])
    end
    render json: @books
  end

  def show
    begin
      render json: book, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    begin
      book.update(book_params)
      render json: book, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  def destroy
    begin
      book.destroy
      render json: { message: 'El libro se ha eliminado correctamente' }, status: :see_other
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    rescue ActiveRecord::InvalidForeignKey => e
      render json: { error: e.message }, status: :not_found
    end
  end

  private

  def book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(:title, :author, :editorial, :available)
  end
end
