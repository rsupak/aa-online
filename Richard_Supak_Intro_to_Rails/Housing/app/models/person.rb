# == Schema Information
#
# Table name: people
#
#   id          :integer     not null, primary key
#   name        :string      not null
#   house_id    :integer     not null
#   created_at  :datetime
#   updated_at  :datetime
#

class Person < ActiveRecord::Base
  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House
end
