class FrontOffice::FormsUploadsController < FrontOfficeController
  before_action :set_front_office_forms_upload, only: %i[ show edit update destroy ]

  # GET /front_office/forms_uploads or /front_office/forms_uploads.json
  def index
    raw_sql = <<~SQL
      LEFT OUTER JOIN forms_uploads
      ON "forms_uploads"."form_id" = "forms"."id"
      AND "forms_uploads"."user_id" = '#{current_user.id}'
    SQL
    @form_with_forms_uploads = Form.all.joins(raw_sql).select("forms.*, forms_uploads.id as forms_upload_id")
  end

  # GET /front_office/forms_uploads/new
  def new
    @form = Form.find(params[:form_id])
    @form_upload = @form.forms_uploads.new
  end

  # GET /front_office/forms_uploads/1/edit
  def edit
  end

  # POST /front_office/forms_uploads or /front_office/forms_uploads.json
  def create
    @form_upload = Forms::Upload.new(forms_upload_params)
    @form_upload.user_id = current_user.id

    respond_to do |format|
      if @form_upload.save
        format.html { redirect_to edit_front_office_forms_upload_url(@form_upload), notice: "Forms upload was successfully created." }
        format.json { render :show, status: :created, location: @form_upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @form_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /front_office/forms_uploads/1 or /front_office/forms_uploads/1.json
  def update
    respond_to do |format|
      if @form_upload.update(forms_upload_params)
        format.html { redirect_to edit_front_office_forms_upload_url(@form_upload), notice: "Forms upload was successfully updated." }
        format.json { render :show, status: :ok, location: @form_upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @form_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_front_office_forms_upload
    @form_upload = Forms::Upload.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def forms_upload_params
    params.require(:forms_upload).permit(:document, :form_id)
  end
end
