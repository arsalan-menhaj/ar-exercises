class Store < ActiveRecord::Base
  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :sells_mens_or_womens_apparel

  def destroy
    if self.employees.all.count > 0
      return false
    end
    super
  end


  def sells_mens_or_womens_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "must be true if the other category is false, and vice-versa.")
    end
  end
end
