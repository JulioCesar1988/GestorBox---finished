class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :edit, :update, :destroy]

  # GET /boxes
  # GET /boxes.json
  def index

  if current_user.role == "admin" or current_user.role == "archivador"
   @boxes = Box.all.where([ "ubicacion LIKE ?  or  codigo LIKE ? or precinto_A LIKE ? or precinto_B LIKE ? or descripcion LIKE ? ","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%" ,"%#{params[:search]}%","%#{params[:search]}%"]) # Todas las cajas , esta deberia de ser solo para el admin 
   else    
  if current_user.role == "jefe"
  @boxes = current_user.sector.boxes.where([ "ubicacion LIKE ?  or  codigo LIKE ? or precinto_A LIKE ? or precinto_B LIKE ? or descripcion LIKE ? ","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%" ,"%#{params[:search]}%","%#{params[:search]}%"]) # Todas las cajas , esta deberia de ser solo para el admin 
   end
   
  end

  end

  # GET /boxes/1
  # GET /boxes/1.json
  def show
  end

  # GET /boxes/new
  def new
    @box = Box.new
  end

  # GET /boxes/1/edit
  def edit
  end

  # POST /boxes
  # POST /boxes.json
  def create
    @box = Box.new(box_params)
     
    respond_to do |format|

      if @box.save
       

       @box.sector_id = current_user.sector_id # Agregamos el Id del Sector .
    @box.codigo = @box.sector.cod + @box.category.cod + @box.fecha.strftime('%y%m')
       @box.codigo += current_user.sector.boxes.count.to_s.rjust(4,'0')

        @box.save
        format.html { redirect_to @box, notice: 'Box was successfully created.' }
        format.json { render :show, status: :created, location: @box }
      else
        format.html { render :new }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boxes/1
  # PATCH/PUT /boxes/1.json
  def update
    respond_to do |format|
      if @box.update(box_params)
        format.html { redirect_to @box, notice: 'Box was successfully updated.' }
        format.json { render :show, status: :ok, location: @box }
      else
        format.html { render :edit }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boxes/1
  # DELETE /boxes/1.json
  def destroy
    @box.destroy
    respond_to do |format|
      format.html { redirect_to boxes_url, notice: 'Box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      @box = Box.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def box_params
      params.require(:box).permit(:descripcion, :sector_id, :category_id, :codigo, :ubicacion, :precinto_A, :precinto_B, :fecha)
    end
end
