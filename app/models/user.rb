class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books


  enum gender: { man: 0, woman: 1, no_selection: 2}

  enum ages: {　infant: 0, teens: 10, twenties: 20, thirties: 30, forties: 40, fifties: 50, sixties: 60, seventies:70, eighties: 80, nineties: 90, over_hundred: 100
  }

  validates :nickname, presence: true
  validates :occupation, presence: true

  
end
