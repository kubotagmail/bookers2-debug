class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    if @book_comment.save
      # redirect_to book_path(@book)
      
      # ここで@book_commentを初期化してあげたい
       @book_comment = BookComment.new
    else
      @user = @book.user
      # render 'books/show'
    end
  end

  def destroy
    @comment = BookComment.find(params[:id])
    @book_comment = BookComment.new
    # params[カラム]
    @comment.destroy
    # @commentの親モデルbookを指定
    @book = @comment.book
    # redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
