class PostsController < ApplicationController
    def index 
        @posts = Post.all.order("created_at ASC")
    end

    def show
        @post = Post.find(params[:id])
    end

    def new   
    end

    def create
        Post.create(title: post_params[:title], category: post_params[:category], image: post_params[:image],content: post_params[:content] )

        redirect_to('/posts')
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        post = Post.find(params[:id])
        post.update(post_params)
        if post.save
            redirect_to('/posts')
        else
            render('posts/edit')
        end

    end

    private
        def post_params
            params.permit(:title, :category, :image, :content)
        end
    
end
