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

      @import = read_file_mont_hash(params[:import][:data], params[:import][:cdg_import])

      ImportFilesWeatherJob.perform_later(@import.id)

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
      #create impor com cdg_import
      import = Import.create(cdg_import: cdg_import)

      #for para passar por todos arquivos
      files.each_with_index do |file, linha|
        # cria o obj para import
        import_data = ImportDatum.create(path_file: '', tb_import_id: import.id)

        #arualiza path do arquivo a ser salvo
        import_data.update_column(:path_file, "#{Date.today.strftime("%Y_%m_%d")}_#{import_data.id}")
        #monta caminho com nome do arquivo a ser processado
        file_path_to_save_to = "public/import/#{import_data.path_file}"
        #Salva o arquivo localmente para ser processardo no sidekiq
        File.write(file_path_to_save_to, file.read.force_encoding("UTF-8"))

        #counta quantas linhas tem o arquivo
        count_row = (File.open(file.tempfile.path)&.count-9)
        #atualiza objeto
        import_data.update_column(:total, count_row)
      end
      return import
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
