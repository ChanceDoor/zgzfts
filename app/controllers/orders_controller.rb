class OrdersController < ApplicationController

  def new
    if params[:product].nil?
      flash[:danger] = "您未选择产品"
      redirect_to order_order_path
    end
    @product = params[:product]
  end

  def create
    if captcha_valid? params[:captcha]
      order = Order.new(order_params)
      if order.save
      else
        p "===wrong"
      end
      order.delay(queue: 'orders').send_order
      flash[:success] = "订单已提交，请等待我们联系您。"
      redirect_to order_order_path
    else
      flash.now[:danger] = "验证码错误"
      render "new"
    end
  end

  def books
  end

  def brochures
    render books
  end

  def magazines
    render books
  end

  private
    def order_params
      params.require(:order).permit(:name, :phone, :product_type, :qq, :email, :created_at, :updated_at)
    end
end
