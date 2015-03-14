class ContributionForm
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :user_id, Integer
  attribute :fund_id, Integer
  attribute :amount, Integer
  attribute :message, String
  attribute :payment, String
  attribute :contact, String

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

private
  def persist!
    @user = User.find(user_id)
    @user.update_attributes!({
      contact: contact
    })
    @contribution = Contribution.create!({
      user_id: user_id,
      fund_id: fund_id,
      amount: amount,
      message: message,
      payment: payment
    })
  end
end