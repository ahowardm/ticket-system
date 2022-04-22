class TicketsController < ApplicationController
  before_action :find_ticket, only: [:show, :edit, :update, :destroy, :update_status]
  before_action :load_references, only: [:new, :edit]

  def index
    @tickets = Ticket.all.includes(:project)
  end

  def show
    get_ticket_statuses
  end

  def update_status
    @ticket.update! ticket_status_id: params[:update_status][:ticket_status_id]
    redirect_to @ticket
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.create!(ticket_params.merge({user: current_user}))
    redirect_to tickets_path, notice: 'Ticket creado con éxito'
  end

  def edit ; end

  def update
    @ticket.update ticket_params
    redirect_to tickets_path
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: 'Ticket eliminado con éxito'
  end

  private
    def ticket_params
      params.require(:ticket).permit(:title, :description, :project_id, :ticket_status_id, :user_id)
    end

    def find_ticket
      @ticket = Ticket.find params[:id]
    end

    def load_references
      get_ticket_statuses
      @projects = Project.all.map {|p| [p.name, p.id]}
    end

    def get_ticket_statuses
      @ticket_statuses = TicketStatus.all.map {|t| [t.name, t.id]}
    end
end
