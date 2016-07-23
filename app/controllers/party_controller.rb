class PartyController < ApplicationController
  def create
    Party.create(attributes.merge(person: person))
    render 'show'
  end

  def new
  end

  def update
    party.update(attributes)
    render 'show'
  end

  def destroy
    party.destroy
    render 'index'
  end

  def show
    party
  end

  def index
    @parties = Party.where(person_id: person.id)
  end

  private

  def attributes
    params.require(:party).permit(:date)
  end

  def person
    @person ||= Person.find(params[:person_id])
  end

  def party
    @party ||= Party.where(person_id: person.id).find(params[:id])
  end
end
