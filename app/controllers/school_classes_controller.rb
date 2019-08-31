class SchoolClassesController < ApplicationController
  
  def index
    @schoolClasses = SchoolClass.all
  end

  def show
    @school_class = SchoolClass.find(params[:id])
  end

  def new
    @school_class = SchoolClass.new 
  end

  def create
    new_class = SchoolClass.create(school_params)
    redirect_to school_class_path(new_class)
  end


  def edit
    @school_class = SchoolClass.find(params[:id])
  end

  def update #update based on what the form responses were
    school_class = SchoolClass.find(params[:id]) #find what this is associated with >> school_class = instance of SchoolClass with id, title, room_number
    school_class.update(school_params) #update school instance based on the form  >>  school_params = <ActionController::Parameters {"title"=>"Magical Potions", "room_number"=>"617"} permitted: true>
    redirect_to school_class_path(school_class) #redirect to the individual show page >> school_class_path = /school_classes 
  end

  def destroy 
    school_class = SchoolClass.find(params[:id])
    school_class.destroy 
    redirect_to school_classes_path
  end 

  private 

  def school_params
    params.require(:school_class).permit(:title, :room_number) 
    ##not entireley sure what is being passed into require(). The route? '/school_classes/:id?
  end

end
