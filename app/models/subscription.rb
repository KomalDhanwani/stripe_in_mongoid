class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  include User::Roles

  belongs_to :plan
  belongs_to :user


  field :user_id, type: String
  field :plan_id, type: String
  field :card_type,   type: String
  field :card_id, type: Integer
  field :stripe_customer_token, type: String
  field :stripe_subscribe_token, type: String
  
  validates_presence_of :user_id, :plan_id

  
  def save_with_payment
    if true || valid?
      customer = Stripe::Customer.create(description: user.email, plan: plan_id, card: stripe_subscribe_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

end
