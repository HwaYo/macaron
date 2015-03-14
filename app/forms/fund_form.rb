class FundForm
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :fund
  attr_reader :user
  
  attr_reader :gift_id
  attr_reader :friend_id


  attribute :description, String
  attribute :situation, Integer
  attribute :user_id, Integer
  attribute :friend_id, Integer
  attribute :gift_id, Integer

  attribute :contact, String

  SITUATIONS = [
    "생일",
    "백일"
  ].map.with_index { |situation, value| [situation, value] }

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
    @user.update!({
      contact: contact  
    })

    @fund = Fund.create!({
      description: description,
      situation: situation,
      user_id: user_id,
      friend_id: friend_id,
      gift_id: gift_id
    })
  end
end