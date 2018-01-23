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
    # Book.joins(:user).where(
    #   "users.gender = ? or users.ages = ? or users.occupation = ? or books.genre = ?", 
    #   @gender, @ages, @occupation, @genre)
    # Book.joins(:user).where("users.gender = ? and users.ages = ? and users.occupation = ?" , @gender, @ages, @occupation)
    query = Book.joins(:user)
    query = query.where("users.gender = ?", @gender) if @gender.present?
    query = query.where("users.ages = ?", @ages) if @ages.present?
    query = query.where("users.occupation = ?", @occupation) if @occupation.present?
    query = query.where("books.genre = ?", @genre) if @genre.present?
    return query

    # books.each do |book|
    #   book.user.name
    # Book.joins(:user).where("users.occupation = ?", @occupation)
  end 
end


# = form_for @book_form, url: "search_path" do |f|
#   = f.text_field :author
#   = f.text_field :pulished_date