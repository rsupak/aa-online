# == Schema Information
#
# Table name: cats
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  house_id   :integer
#

class Cat < ActiveRecord::Base
  validates :name, presence: true
  validates :color, presence: true
  validate :no_green_cats

  def no_green_cats
    errors[:color] << "can't be green" if color == 'green'
  end

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'

  has_many :toys,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'Toy'
end
