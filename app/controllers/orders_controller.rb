class OrdersController < ApplicationController

  def new
    if params[:product].nil?
      flash[:danger] = "您未选择产品"
      redirect_to order_order_path
    end
    @product = params[:product]
  end

  def create
    puts params[:order][:product]
    puts  params[:order][:contact]
    if captcha_valid? params[:captcha]
      require 'pony'
      Pony.mail(
        :from => "cd19900419@gmail.com",
        :to => "cd19900419@hotmail.com",
        :subject => "元法图书网：您有新的订单",
        :body => "产品：#{params[:order][:product]} \n 联系人姓名：#{ params[:order][:contact][:name] }\n联系人电话：#{ params[:order][:contact][:phone]}\n联系人QQ：#{params[:order][:contact][:name]}\n联系人邮箱：#{ params[:order][:contact][:email] }\n订单时间：#{ Time.now.strftime("%Y-%M-%D %h:%m:%s")}",
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'cd19900419@gmail.com',
        :password             => 'change_to_password',
        :authentication       => :plain,
        :domain               => 'localhost.localdomain'
      })
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
end
