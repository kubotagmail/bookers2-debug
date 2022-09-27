class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    # 元の記述はredirect_to books_path
    
    # 同じページをリダイレクトする
    # コメントのバリデーションがかかった後にいいねを押すとNo route matches のエラーが出るが、想定していないため、挙動として正しい。
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    # redirect_to books_path
    redirect_to request.referer
  end
end
