class InstallationsController < ApplicationController
  before_action :set_client
  before_action :fetch_parts, only: %i[create]
  
  def new
    @installation = @client.installations.build
  end

  def create
    @installation = @client.installations.build installation_create_params

    if @installation.save
      respond_to do |format|
        format.html do
          flash[:success] = "Water purifier has been added"
          redirect_to client_path(@client)
        end

        format.turbo_stream do
          flash.now[:success] = "Water purifier has been added"
        end
      end
      ServiceCreator.new(@client, @purifier_parts).call(@installation.date)

    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def installation_create_params
    params.require(:installation).permit(:date,
                                         :pressure,
                                         :in_tds,
                                         :out_tds,
                                         :notes,
                                         :status)
  end

  def set_client
    @client = Client.find params[:client_id]
    @client.decorate
  end

  def fetch_parts 
    @purifier_parts = PurifierPart.all
  end
end