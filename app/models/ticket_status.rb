# == Schema Information
#
# Table name: ticket_statuses
#
#  id         :bigint           not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TicketStatus < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
