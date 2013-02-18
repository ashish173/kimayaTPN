class HospitalsController < ApplicationController
  layout 'admin'  

  def index
    @hospitals = Hospital.all
  end

  def new
    @hospital = Hospital.new
    @hospital.users.build
  end

  def create
    @hospital = Hospital.new(params[:hospital])
    if @hospital.save
      flash[:notice] = "Successfully added new Hospital"
      redirect_to :action => :index
    else
      flash[:notice] = "Something Went Wrong Please Try again"
      redirect_to :action => :new
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
    render :layout => false
  end

  def update
   @hospital = Hospital.find(params[:id])
   if @hospital.update_attributes(params[:hospital])
     flash[:notice] = "Successfully edited Hospital"
     redirect_to :action => :index
   else
     flash[:notice] = "Something Went Wrong Please Try again"
     redirect_to :action => :edit
   end
  end

  def show
    @hospital = Hospital.find(params[:id])
    render :layout => false
  end

end
