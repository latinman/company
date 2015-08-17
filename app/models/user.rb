class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  attr_accessor :stripeToken

  def payment
    if valid?
      customer = Stripe::Customer.create(
          description: email,
          plan: plan_id,
          card: stripeToken
      )
      self.stripeToken = customer.id
      save!
    end
  end


end
