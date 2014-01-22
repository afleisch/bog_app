class CreaturesController < ApplicationController

  def index
  	@creatures = Creature.all
	render :index
  
  end

  def new
  	render :new

  end

  def create
  	creature = params.require(:creature).permit(:name, :description)
  	Creature.create(creature)
  	redirect_to "/creatures"
  
  end

  def show
  	creature_id = params[:id]
  	@creature = Creature.find(creature_id)
  	render :show
  end

  def edit
  	creature_id = params[:id]
  	@creature = Creature.find(creature_id)
  	render :edit
  end

  def update
  	creature_id = params[:id]
  	creature = Creature.find(creature_id)

  	updated_info = params.require(:creature).permit(:name, :description)
  	creature.update_attributes(updated_info)

  	redirect_to "/creatures/#{creature.id}"
  end

  def delete
  	creature_id= params[:id]
  	creature = Creature.find(creature_id)
	creature.delete
  	redirect_to "/creatures"

  end





end