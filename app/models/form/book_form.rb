class BookForm
  include ActiveModel::Model

  attr_accessor :author, :published_date, :review_rate

  def initialize(params)
    @author = params[:author]
    @published_rate = params[:published_date]
  end

  def search
    Book.joins(:reviews).where("books.author = ? and books.published_date >= ? and reviews_rate = ?", @author, @published_date, @review_rate)
  end
end


# = form_for @book_form, url: "search_path" do |f|
#   = f.text_field :author
#   = f.text_field :pulished_date
#   