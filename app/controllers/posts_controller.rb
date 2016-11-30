class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_or_request, only: :index
  before_action :authenticate, only: :show
  before_action :authenticate_preview_realm, only: :preview

  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  protected

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :thumbnail, :media, :type)
    end
    
    def authenticate_or_request
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end

    def authenticate_preview_realm
      authenticate_or_request_with_http_token('Preview') do |token, options|
        User.find_by(auth_token: token)
      end
    end

    def authenticate_banana_realm
      authenticate_token || render_unauthorized('Banana')
    end

    def render_unauthorized(realm=nil)
      if realm
        self.headers['WWW-Authenticate'] = %(Token realm="#{realm.gsub(/"/, "")}")
      end
      render json: 'Bad credentials', status: 401
    end
end
