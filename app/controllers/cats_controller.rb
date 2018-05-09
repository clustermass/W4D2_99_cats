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
    date_of_birth = Date.parse((now.year - cats_params[:birth_date].to_i).to_s + '/01/01') unless cats_params[:birth_date].to_i < 0

    @cat = Cat.new(cats_params)
    @cat.update(birth_date: date_of_birth)

    if @cat.save
     redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cats_params)

    if @cat.save
     redirect_to cat_url(@cat)
    else
      render :edit
    end

  end

private
  def cats_params
    params.require(:cat).permit(:name,:color,:birth_date,:sex,:description)
  end

end
