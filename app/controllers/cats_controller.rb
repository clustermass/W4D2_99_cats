class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end


  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    now = Date.today
    date_of_birth = Date.parse((now.year - cat_params[age]).to_s + '/01/01') unless cat_params[age] < 0
    @cat = Cat.new(name: cat_params[name], color: cat_params[color], description: cat_params[description], sex: cat_params[sex], birth_date: date_of_birth)
    if @cat.create!
     redirect_to cat_url(@cat)
    else
      render :new
    end

  end

private
  def cats_params
    params.require(:cat).permit(:name,:color,:age,:sex,:description)
  end

end
