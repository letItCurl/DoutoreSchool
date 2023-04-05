class BackOffice::FormsController < BackOfficeController
  before_action :set_back_office_form, only: %i[ edit update destroy ]

  # GET /back_office/forms or /back_office/forms.json
  def index
    @forms = Form.all
  end

  # GET /back_office/forms/new
  def new
    @form = Form.new
  end

  # GET /back_office/forms/1/edit
  def edit
  end

  # POST /back_office/forms or /back_office/forms.json
  def create
    @form = Form.new(back_office_form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to edit_back_office_form_url(@form), notice: "Form was successfully created." }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /back_office/forms/1 or /back_office/forms/1.json
  def update
    respond_to do |format|
      if @form.update(back_office_form_params)
        format.html { redirect_to edit_back_office_form_url(@form), notice: "Form was successfully updated." }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /back_office/forms/1 or /back_office/forms/1.json
  def destroy
    @form.destroy

    respond_to do |format|
      format.html { redirect_to back_office_forms_url, notice: "Form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_back_office_form
    @form = Form.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def back_office_form_params
    params.require(:form).permit(:title, :description, :document)
  end
end
