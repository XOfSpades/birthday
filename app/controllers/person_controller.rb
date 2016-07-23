class PersonController < ApplicationController
  def create
    @person = Person.create(attributes)
    render 'show'
  end

  def new
  end

  def update
    person.update(attributes)
    render 'show'
  end

  def destroy
    person.destroy
  end

  def show
    person
  end

  def index
    @persons = Person.all
  end

  private

  def attributes
    params.require(:person).permit(:first_name, :last_name, :email)
  end

  def person
    @person ||= Person.find(params[:id])
  end


end
