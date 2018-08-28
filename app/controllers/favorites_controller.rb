class FavoritesController < ApplicationController
  def create
    favorite = current_applicant.favorites.create(blog_id: params[:blog_id])
    redirect_to recruit_blogs_url, notice: "登録しました"
  end

  def destroy
    favorite = current_applicant.favorites.find_by(id: params[:id]).destroy
    redirect_to recruit_blogs_url, notice: "登録解除しました"
  end

end
