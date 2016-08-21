class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article =Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.create(article_params)
		if @article.save
			flash[:success] = "#{@article.title} created"
			redirect_to article_path(@article)
		else
			flash[:danger] = "Error creating article"
			render "new"
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:success] = "#{@article.title} deleted"
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			flash[:success] = "#{@article.title} updated"
			redirect_to @article
		else
			flash[:danger] = "Error updating article"
			render "edit"
		end
	end

	private

		def article_params
			params.require(:article).permit(:title, :body, :tag_list)
		end
end
