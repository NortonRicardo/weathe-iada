class ImportsController < ApplicationController
  before_action :set_import, only: %i[ show edit update destroy ]

  def index
    @imports = Import.all
  end

  def show
  end

  def new
    @import = Import.new
  end

  def edit
  end

  def upload_info_view
    @cdg_import = params[:cdg_import]
    @import = Import.find_by(cdg_import: @cdg_import)
    @import_data = @import&.import_datas
  end

  def dispara_job
    ImportFilesWeatherJob.perform_later(params[:id])
  end


  def create
    if params.present? && params[:import].present? && params[:import][:data].present?

      @import = read_file_mont_hash(params[:import][:data],
                                    params[:import][:cdg_import])

      ImportFilesWeatherJob
        .perform_later(@import.id) if @import.present?

      redirect_to imports_path, notice: "Arquivos Importados!!!"

    else
      redirect_to new_import_path, notice: "Nenhum Arquivo Selecionado"
    end
  end

  def update
    respond_to do |format|
      if @import.update(import_params)
        format.html { redirect_to @import, notice: "Import was successfully updated." }
        format.json { render :show, status: :ok, location: @import }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: "Import was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def read_file_mont_hash(files, cdg_import)

    import = Import.create(cdg_import: cdg_import)

    files.each_with_index do |file, linha|
      count_row = (File.open(file.tempfile.path)&.count-9)
      import_data = ImportDatum.create( total: count_row, tb_import_id: import.id)
      import_data.file.purge
      import_data.file.attach(file)
    end

    return import
  end

  def set_import
    @import = Import.find(params[:id])
  end

  def import_params
    params.fetch(:import, {})
  end
end
