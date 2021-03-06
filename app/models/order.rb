class Order < ActiveRecord::Base
  attr_accessor :card_number, :card_verification
belongs_to :cart
has_many :cart_items
has_many :transactions, class_name: "OrderTransaction"

before_create :validate_card

  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)

    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end


  def price_in_cents
    (self.total_price * 100).round
  end

  private

  def purchase_options
    {
      ip: ip_address,
      billing_address: {
        name:     "#{first_name} #{last_name}",
        address:  address,
        city:     city,
        state:    state,
        country:  country,
        zip:      zip_code
      }
    }
  end


    def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        message
      end
    end
  end
end
