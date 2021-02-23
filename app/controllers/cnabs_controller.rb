class CnabsController < ApplicationController
  before_action :set_cnab, only: [:show, :edit, :update, :destroy]

  # GET /cnabs
  # GET /cnabs.json
  def index
    @cnabs = Cnab.where(user_id: current_user.id).uniq(&:store_id)
  end

  def import
    cnab = CnabServices.import(cnab_params, current_user.id)
    if cnab[:status]
      flash[:success] = cnab[:message]
      redirect_to cnabs_path
    else
      flash[:error] = cnab[:message]
      redirect_to new_cnab_path
    end
  end

  def delete_all
    cnabs = Cnab.all
    flash[:success] = "Removido com sucesso! #{cnabs.length} registros"
    cnabs.each do |cnab|
      cnab.store.update(balance_total: 0.0)
    end
    cnabs.delete_all
    redirect_to cnabs_path
  end

  private

  # Only allow a list of trusted parameters through.
  def cnab_params
    params.permit(:file)
  end
end
