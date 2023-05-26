# frozen_string_literal: true

class ChangeItemMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.change_item_mailer.create_noti.subject
  #
  def create_noti(object)
    @object = object
    @object_count = object.class.count
    mail to: 'vyadav@bestpeers.com', subject: 'A new entry has been created in item'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.change_item_mailer.upd_noti.subject
  #
  def upd_noti(object)
    @object = object
    @object_count = object.class.count
    mail to: 'vyadav@bestpeers.com', subject: 'A new entry has been Updated in item'
  end
end
