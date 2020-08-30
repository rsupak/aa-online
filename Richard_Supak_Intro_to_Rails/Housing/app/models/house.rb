# == Schema Information
#
# Table name: houses
#
#   id          :integer     not null, primary key
#   address     :string      not null
#   created_at  :datetime
#   updated_at  :datetime
#

class House < ActiveRecord::Base
  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :Cat
  def people
    People.where(house_id: self.id)
  end
end
