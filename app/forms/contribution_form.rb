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

  validates :amount, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validate :not_over_remain_amount
  validate :no_less_than_equal_zero_amount

  def fund
    @fund = Fund.find(fund_id)
  end

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

  def not_over_remain_amount
    if amount.present? and self.fund.remain_amount < amount
      errors.add(:amount, "최대 참여 가능 금액을 초과하였습니다.")
    end
  end

  def no_less_than_equal_zero_amount
    if amount.present? and amount <= 0
      errors.add(:amount, "0원 이하로 낼 수 없습니다.")
    end
  end
end