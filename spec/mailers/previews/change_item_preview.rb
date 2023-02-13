# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/change_item
class ChangeItemPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/change_item/create_noti
  def create_noti
    ChangeItemMailer.create_noti
  end

  # Preview this email at http://localhost:3000/rails/mailers/change_item/upd_noti
  def upd_noti
    ChangeItemMailer.upd_noti
  end
end
