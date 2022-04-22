class TicketStatusesController < ApplicationController
  before_action :find_ticket_status, only: [:edit, :update, :destroy]

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

  def edit ; end

  def update
    @ticket_status.update ticket_status_params
    redirect_to ticket_statuses_path
  end

  def destroy
    @ticket_status.destroy
    redirect_to ticket_statuses_path
  end

  private
    def ticket_status_params
      params.require(:ticket_status).permit(:name)
    end

    def find_ticket_status
      @ticket_status = TicketStatus.find params[:id]
    end
end
