# == Schema Information
#
# Table name: tickets
#
#  id               :bigint           not null, primary key
#  description      :text             not null
#  title            :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  project_id       :bigint
#  ticket_status_id :bigint
#  user_id          :bigint
#
# Indexes
#
#  index_tickets_on_project_id        (project_id)
#  index_tickets_on_ticket_status_id  (ticket_status_id)
#  index_tickets_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (ticket_status_id => ticket_statuses.id)
#  fk_rails_...  (user_id => users.id)
#
class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :ticket_status

  validates :title, presence: true
  validates :description, presence: true
end
