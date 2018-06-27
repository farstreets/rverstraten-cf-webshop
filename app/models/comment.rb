class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # Called by e.g. <%= @product.comments.rating_desc.first %>
  scope :rating_desc, -> { order(rating: :desc) }
  # Called by e.g. <%= @product.comments.rating_asc.first %>
  scope :rating_asc, -> { order(rating: :asc) }

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

end
