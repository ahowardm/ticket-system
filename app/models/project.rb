# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Project < ApplicationRecord
  has_many :tickets

  validates :name, presence: true, uniqueness: true
end
