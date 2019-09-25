class Hunter < ApplicationRecord

  belongs_to :playbook
  validates :harm, numericality: { less_than_or_equal_to: 7, greater_than_or_equal_to: 0 }
  validates :luck, numericality: { less_than_or_equal_to: 7, greater_than_or_equal_to: 0 }

end
