class ImportsController < ApplicationController
  before_action :set_import, only: %i[ show edit update destroy ]

  # GET /imports or /imports.json
  def index
    @imports = Import.all
  end

  # GET /imports/1 or /imports/1.json
  def show
  end

  # GET /imports/new
  def new
    @import = Import.new
  end

  # GET /imports/1/edit
  def edit
  end

  def upload_info_view
    sleep 4
    @cdg_import = params[:cdg_import]
    @import = Import.find_by(cdg_import: @cdg_import)
    @import_data = @import&.import_datas

  end

  # POST /imports or /imports.json
  def create
    if params.present? && params[:import].present? && params[:import][:data].present?

      @file_total_row, @import = read_file_mont_hash(params[:import][:data], params[:import][:cdg_import])

      path_file = []
      FileUtils.rm_rf(Dir.glob('public/import/*'))
      @file_total_row.each_with_index.each do |t, index|
        file_path_to_save_to = "public/import/file_import_#{index}"
        path_file << file_path_to_save_to
        File.write(file_path_to_save_to, t.read.force_encoding("UTF-8"))
      end

      ImportFilesWeatherJob.perform_later([path_file, @import.id])
      @cdg_import = @import.cdg_import
      @import_data = @import&.import_datas
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
    hash_files = []
    import = Import.create(total_files: files.count, cdg_import: cdg_import)

    files.each_with_index do |file, linha|
      hash_files << file
      obj = File.open(file.tempfile.path)

      ImportDatum.create(total: (obj.count-9),
                         sucess: 0,
                         erros: 0,
                         order_file: linha,
                         tb_import_id: import.id)
    end
    return hash_files, import
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_import
    @import = Import.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def import_params
    params.fetch(:import, {})
  end
end
