class BookCommentsController < ApplicationController
	def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @user = @book.user
    if @comment.save
       @book_comment = BookComment.new
       render :create
       #@book_new = Book.new




       #redirect_to book_path(book)
       #else
       #redirect_to book_path(book)
    end

    end

    def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    #redirect_to book_path(params[:book_id])
    @book = Book.find(params[:book_id])
    @user = @book.user
    @book_comment = BookComment.new
    render :destroy
    end


private

def book_comment_params
    params.require(:book_comment).permit(:comment)
end


end