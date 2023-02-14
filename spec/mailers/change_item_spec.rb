# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChangeItemMailer, type: :mailer do
  describe 'create_noti' do
    let(:mail) { ChangeItemMailer.create_noti }

    it 'renders the headers' do
      expect(mail.subject).to eq('Create noti')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end

  describe 'upd_noti' do
    let(:mail) { ChangeItemMailer.upd_noti }

    it 'renders the headers' do
      expect(mail.subject).to eq('Upd noti')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
