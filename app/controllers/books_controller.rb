class BooksController < ApplicationController
   before_action :find_book, only: [:show, :destroy, :update, :edit]
   before_action :authorize, except: [:show, :index]

   def index
      @books = Book.all
   end

   def new
      @book = Book.new
   end

   def create
      @book = Book.new(book_params)
      @book.user_id = (current_user).id
      if @book.save
         redirect_to books_path
      else
         redirect_to new_book_path
      end
   end

   def show
      @book
   end

   def destroy
      @book.delete
      redirect_to books_path
   end

   def edit
      @book
   end

   def update
      @book.update(book_params)
      redirect_to books_path
   end


   private

   def book_params
      params.require(:book).permit(:book_title, :author, :description, :url)
   end

   def find_book
      @book = Book.find(params[:id])
   end
end
