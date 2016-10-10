class Api::V1::PostsController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token
  def index
    render json: User.all, status: 201
  end
  def show
    post = Post.find_by_id(params[:id])
    if post.blank?
      render json: {errors: "No found Post"}
    else
      render json: post, status: 201
    end
  end
  def create
    post = Post.new(params[:post])
    if post.save
      render json: post, status: 201
    else
      render json: {errors: post.errors}, status: 422
    end
  end
  def update
    post = Post.find(params[:id])
    if post.update_attributes(params[:post])
      render json: post, status: 200
    else
      render json: { errors: post.errors }, status: 422
    end
  end
  def destroy
    post = Post.find_by_id(params[:id])
    if post.blank?
      render json: {errors: "No found Post"}
    else
      post.destroy
      head 204
    end
  end
end