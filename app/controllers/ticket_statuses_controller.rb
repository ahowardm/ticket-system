class TicketStatusesController < ApplicationController
  def index
    @ticket_statuses = TicketStatus.all
  end

  def new
    @ticket_status = TicketStatus.new
  end

  def create
    ticket_status = TicketStatus.create! ticket_status_params
    redirect_to ticket_statuses_path
  end

  private
    def ticket_status_params
      params.require(:ticket_status).permit(:name)
    end
end
