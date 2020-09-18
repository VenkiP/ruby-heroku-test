class BooksController < ApplicationController
  #modelled after CRUD: https://www.linkedin.com/learning/ruby-on-rails-5-essential-training/crud
  # and REST: https://www.linkedin.com/learning/ruby-on-rails-5-essential-training/rest
  # and really the rest of the linkedin tutorial

  #R: Read
  # GET: Show all items
  def index
    @books = Book.all
  end

  # GET: show item with :id
  def show
    @book = Book.find(params[:id])
  end

  #C: Create
  # GET: show new item form
  def new
    @book = Book.new
  end

  # POST: create an item
  def create
    @book = Book.new(subject_params)
    if @book.save
      redirect_to(books_path)
    else
      render('new')
    end
  end

  #U: Update
  # GET: show edit for for item with :id
  def edit
    @book = Book.find(params[:id])
  end

  # PATCH: Update item with :id
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(subject_params)
      redirect_to(book_path(@book))
    else
      render('edit')
    end
  end

  #D: Delete
  # GET: Show delete form for item with :id
  def delete
    @book = Book.find(params[:id])
  end

  # DELETE: Delete item with :id
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to(books_path)
  end

  private

  def subject_params
    params.require(:book).permit(:title, :author, :genre, :price, :publishdate)
  end


end
