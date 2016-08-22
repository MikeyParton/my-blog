class CommentsController < ApplicationController
	
	before_action :authenticated_user, only: [:destroy]

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.build(comment_params)

		if @comment.save
			redirect_to article_path(@comment.article)
		else

		end
	end

	def destroy

	end

	private

		def comment_params
			params.require(:comment).permit(:author, :body)
		end

end