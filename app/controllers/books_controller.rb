class BooksController < ApplicationController

	before_action :authenticate_user!, except: [:show, :index]

	def index
		@books = Book.includes(:user).order('id DESC').limit(8)
	end

	def new
	end

	def create
		Book.create(title: book_params[:title], genre: book_params[:genre], author: book_params[:author], image: book_params[:image], text: book_params[:text], user_id: current_user.id)
		redirect_to :action => "index"
	end

	def destroy
		book = Book.find(params[:id])
      if book.user_id == current_user.id
        book.destroy
      end
      redirect_to controller: :users, action: :show
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
      book = Book.find(params[:id])
      if book.user_id == current_user.id
        book.update(book_params)
        redirect_to controller: :users, action: :show
      end
	end

	def show
    @book = Book.find(params[:id])
	end

	def search
    @book_form = Form::BookForm.new
	end

  def result
    book_form = Form::BookForm.new(search_book_params)
    @results = book_form.search.page(params[:page]).per(5)
    # binding.pry
  end

	private

	def book_params
		params.permit(:title, :genre, :author, :image, :text)
	end

	def move_to_index
		redirect_to action: :index unless user_signed_in?
	end

  def search_book_params
    params.require(:form_book_form).permit(:gender, :ages, :occupation, :genre)
  end


end
