class CommentUpdateJob < ApplicationJob
  queue_as :default

  # This test gives warning:
  # CommentUpdateJob add some examples to (or delete) /Users/farstreets/WebDev/3_10 Restart/rverstraten_webshop/spec/jobs/comment_update_job_spec.rb
  #   # Not yet implemented
  #   # ./spec/jobs/comment_update_job_spec.rb:4
  def perform(comment, current_user)
    ProductChannel.broadcast_to(comment.product_id, comment: render_comment(comment, current_user), average_rating: comment.product.average_rating)
  end

  private

    def render_comment(comment, current_user)
      CommentsController.render(partial: 'comments/comment', locals: { comment: comment, current_user: current_user })
    end

end
