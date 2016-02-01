class VisitorsController < ApplicationController
  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "#{@visitor.name}, newsletter assinado com sucesso"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:email, :first_name, :last_name)
  end
end
