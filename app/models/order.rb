class Order < ActiveRecord::Base

  private
  def send_order
    require 'pony'
    Pony.mail(
      :from => "cd19900419@gmail.com",
      :to => "cd19900419@hotmail.com",
      :subject => "元法图书网：您有新的订单",
      :body => "产品：#{self.product_type} \n 联系人姓名：#{ self.name }\n联系人电话：#{ self.phone}\n联系人QQ：#{self.qq}\n联系人邮箱：#{ self.email }\n订单时间：#{ self.created_at.strftime("%Y-%M-%D %h:%m:%s")}",
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'cd19900419@gmail.com',
        :password             => 'password',
        :authentication       => :plain,
        :domain               => 'localhost.localdomain'
      })
    'ok'
  end
end
