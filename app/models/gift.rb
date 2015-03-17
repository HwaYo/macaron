class Gift < ActiveRecord::Base
  has_many :funds

  enum gender: [:common, :male, :female]

  scope :for_user, ->(user) { for_age(user.age).for_gender(user.gender) }
  scope :for_age, ->(age) { where(arel_table[:min_age].lteq(age).and(arel_table[:max_age].gt(age))) }
  scope :for_gender, ->(gender) { where(arel_table[:gender].eq(self.genders[gender]).or(arel_table[:gender].eq(0))) }
end
