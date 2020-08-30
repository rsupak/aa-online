# == Schema Information
#
# Table name: superheros
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  alias      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Superhero < ApplicationRecord
  has_many :abilities,
    primary_key: :id,
    foreign_key: :hero_id,
    class_name: 'Ability'
end
