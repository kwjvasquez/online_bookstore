# frozen_string_literal: true

ActiveAdmin.register Comment do
  permit_params :message, :user_id, :book_id, :approved

  action_item :approved, only: :show do
    unless comment.approved
      link_to "Approve", approved_admin_comment_path(comment),
              method: :patch
    end
  end

  action_item :disapproved, only: :show do
    if comment.approved
      link_to "Disapprove", disapproved_admin_comment_path(comment),
              method: :patch
    end
  end

  member_action :approved, method: :patch do
    comment = Comment.find(params[:id])
    comment.update(approved: true)
    redirect_to admin_comment_path(comment)
  end

  member_action :disapproved, method: :patch do
    comment = Comment.find(params[:id])
    comment.update(approved: false)
    redirect_to admin_comment_path(comment)
  end
end
