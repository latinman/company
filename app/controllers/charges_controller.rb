class ChargesController < ApplicationController

  def new
  end

  def create
    @amount = 4995

    customer = Stripe::Customer.create(
        email: "",
        card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        customer = customer.id,
        amount: @amount,
        description: "tinito customer",
        currency: "usd"
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end