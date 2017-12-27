class Form::BookForm
  include ActiveModel::Model

  attr_accessor :gender, :ages, :occupation, :genre

  def initialize(params={})
    @gender = params[:gender]
    @ages = params[:ages]
    @occupation = params[:occupation]
    @genre = params[:genre]
  end

  def search
    # Book.joins(:user).where("users.gender = ? and users.ages = ? and users.occupation = ? and books.genre = ?" , @gender, @ages, @occupation, @genre)
    # Book.joins(:user).where("users.gender = ?", @gender)
    # Book.joins(:user).where("users.ages = ?", @ages.to_i)
    Book.joins(:user).where("users.occupation = ?", @occupation)
  end 
end


# = form_for @book_form, url: "search_path" do |f|
#   = f.text_field :author
#   = f.text_field :pulished_date
#   