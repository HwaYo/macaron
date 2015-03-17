class Fund < ActiveRecord::Base
  belongs_to :user
  belongs_to :gift
  belongs_to :friend
  has_many :contributions

  def complete?
    remain_amount <= 0
  end

  def total_amount
    @total_amount ||= self.contributions.approved.pluck(:amount).reduce(0, :+)
  end

  def remain_amount
    @remain_amount ||= [0, self.gift.price - self.total_amount].max
  end

  def percentage
    total_amount.to_f / self.gift.price.to_f * 100
  end
end
