class Form::BookForm
  include ActiveModel::Model

  attr_accessor :gender, :ages, :occupation, :genre

  def initialize(params={})
    @gender = params[:gender]
    @published_rate = params[:published_date]
  end

  def search
    Book.joins(:users).where("books.author = ? and books.published_date >= ? and users.nickname = ?", @gender, @published_date, @review_rate)
  end
end


# = form_for @book_form, url: "search_path" do |f|
#   = f.text_field :author
#   = f.text_field :pulished_date
#   