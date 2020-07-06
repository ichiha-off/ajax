class BookCommentsController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.build(book_comment_params)
    @comment.user_id = current_user.id
    # @comment.book_id = @book.id
    @comment.save
  end

  def destroy
    @comment = BookComment.find(params[:id])
    @comment.destroy
  end

private

  def book_comment_params
    params.require(:book_comment).permit(:comment, :book_id, :user_id)
  end

end
