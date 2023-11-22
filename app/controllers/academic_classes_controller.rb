class AcademicClassesController < ApplicationController
  before_action :set_academic_class, only: %i[ show edit update destroy ]

  # GET /academic_classes or /academic_classes.json
  def index
    @academic_classes = AcademicClass.all
  end

  # GET /academic_classes/1 or /academic_classes/1.json
  def show
  end

  # GET /academic_classes/new
  def new
    @academic_class = AcademicClass.new
  end

  # GET /academic_classes/1/edit
  def edit
  end

  # POST /academic_classes or /academic_classes.json
  def create
    @academic_class = AcademicClass.new(academic_class_params)

    respond_to do |format|
      if @academic_class.save
        format.html { redirect_to academic_class_url(@academic_class), notice: "Academic class was successfully created." }
        format.json { render :show, status: :created, location: @academic_class }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @academic_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_classes/1 or /academic_classes/1.json
  def update
    respond_to do |format|
      if @academic_class.update(academic_class_params)
        format.html { redirect_to academic_class_url(@academic_class), notice: "Academic class was successfully updated." }
        format.json { render :show, status: :ok, location: @academic_class }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @academic_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_classes/1 or /academic_classes/1.json
  def destroy
    @academic_class.destroy!

    respond_to do |format|
      format.html { redirect_to academic_classes_url, notice: "Academic class was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_class
      @academic_class = AcademicClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def academic_class_params
      params.require(:academic_class).permit(:name)
    end
end
