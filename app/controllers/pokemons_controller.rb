class PokemonsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @pokemons = params[:search] ? Pokemon.search(params[:search]).sorted : Pokemon.sorted
  rescue StandardError => e
    puts 'Something went wrong'
    puts e
  end

  def show; end

  def new
    @title = 'ADD NEW POKEMON'
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      flash[:notice] = 'Pokemon created successfully'
      redirect_to(pokemons_path)
    else
      render('new')
    end
  rescue StandardError => e
    puts 'Something went wrong'
    puts e
  end

  def edit
    @title = 'Edit pokemon'
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.update(pokemon_params)
      flash[:notice] = 'Pokemon updated successfully'
      redirect_to(pokemons_path)
    else
      render('edit')
    end
  end

  def delete
    @title = 'Delete pokemon'
    @pokemon = Pokemon.find(params[:id])
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    flash[:notice] = "Pokemon '#{@pokemon.name}' destroyed successfully"
    redirect_to(pokemons_path)
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :height, :search)
  end
end
