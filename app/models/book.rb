class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

# 検索方法分岐
# whereメソッドを使いデータベースから該当データを取得し、変数に代入します。
  def self.looks(search, word)
    # ・完全一致→perfect_match
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
      # ・前方一致→forward_match
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
      # ・後方一致→backword_match
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
      # ・部分一致→partial_match
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end

end
