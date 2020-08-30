# == Schema Information
#
# Table name: abilities
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  hero_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ability < ApplicationRecord
  belongs_to :hero,
    primary_key: :id,
    foreign_key: :hero_id,
    class_name: 'Superhero'
end
