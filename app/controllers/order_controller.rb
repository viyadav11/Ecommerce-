# frozen_string_literal: true

class OrderController < ApplicationController
  def index
    @order = Order.all
  end
end
