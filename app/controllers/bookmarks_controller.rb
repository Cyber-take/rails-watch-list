class BookmarksController < ApplicationController
  def new
    @bookmarks = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to bookmark_path(@bookmark), notice: "bookmark was successfully created"
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
