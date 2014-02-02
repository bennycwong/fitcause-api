class Api::V1::MissionsController < ActionController::Base

 
  # GET /api/v1/missions.json
  # GET /api/v1/missions.xml
  def index
    
    if params[:name]
      @mission = Mission.where(:name => params[:name]).order("misson.update_at DESC")
    else
      @mission = Mission.order("missions.updated_at DESC").all
    end 
    respond_to do |format|
      format.json { render json: @mission }
      format.xml { render xml: @mission }
    end     
  end

  # GET /api/missions/1
  # GET /api/missions/1.json
  def show
    if not @mission = Mission.find(params[:id])
      render json: "Mission not found for id: " + params[:id]
    else
      respond_to do |format|
        format.json { render json: @mission }
        format.xml { render xml: @mission }
      end
    end
  end
  
  # POST /api/missions.xml
  # POST /api/missions.json
  def create
    #When creating a new mission, current point should default to zero
    @mission = Mission.new()
    # @mission = Mission.new({"name" => params[:name], "goal_points" => params[:goal_points].to_i, "current_points" => 0, "image" => params[:image]})
    @mission.name = params[:name]
    @mission.goal_points = params[:goal_points].to_i
    @mission.current_points = 0
    @mission.image = params[:image]
    
    
    if @mission.valid? 
      @mission.save!
      respond_to do |format|
        format.json { render json: @mission }
        format.xml { render xml: @mission }
      end
    else
      respond_to do |format|
        #format.json { render action: 'index' }
        format.json { render json: @mission.errors,status: :unprocessable_entity }
         
      end
    end
  end
  
  def update
    
    if !params[:image] && !params[:current_points] && !params[:goal_points] && !params[:name]
      respond_to do |format|
        format.json { render json: "You did not pass in correct parameter. Please pass in one of the following values: goal_points, current_points, image, name", status: :unprocessable_entity }
      end   
    else
     
      #if it can find the record 
      if not @mission = Mission.find(params[:id])
        render json: "Mission not found for id: " + params[:id]
      else
        if params[:name]
          @mission.name = params[:name]
        end
    
        if params[:goal_points]
          @mission.goal_points = params[:goal_points].to_i
        end
    
        if params[:current_points]
          @mission.current_points = params[:current_points].to_i
        end
    
        if params[:image]
          @mission.image = params[:image]
        end
      
        respond_to do |format|
          if @mission.valid?
            @mission.save
            format.json { render json: "Update Successful"}
              
          else
            format.json { render json: @mission.errors, status: :unprocessable_entity }
          end
        end
   
      
      end
    end  
  end

  
  def destroy
    @mission = Mission.where(:_id => params[:id])
    
    if @mission.exists?
      @mission.destroy
      respond_to do |format|
        format.json { render json: "record id: " + params[:id] + " has been deleted"}
      end
    else
      respond_to do |format|
        format.json { render json: "record id: " + params[:id] + " was not found. No records were deleted"}
      end
    end
  
  end
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def mission_params
    params.require(:mission).permit(:name, :image)
  end
  
  
  
end

