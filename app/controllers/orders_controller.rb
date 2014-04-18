class OrdersController < ApplicationController
  def books
  end

  def brochures
    render books
  end

  def magazines
    render books
  end
end
