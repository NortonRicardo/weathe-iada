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
    # FileUtils.rm_rf(Dir.glob('public/import/*'))
    #Verifica se caminho Exite se nao cria
    unless File.directory?("public/import")
      FileUtils.mkdir_p("public/import")
    end

    files.each_with_index do |file, linha|
      # cria o obj para import
      import_data = ImportDatum.create(path_file: '', tb_import_id: import.id)

      #atualiza path do arquivo a ser salvo
      import_data.update_column(:path_file, "public/import/file_#{import_data.id}")

      #   File.write("#{Rails.root}/tmp/import/luci.txt", 'tete norton')
      #   File.exist?("#{Rails.root}/tmp/import/luci.txt")
      #   Dir.entries("#{Rails.root}/tmp/import")

      #Salva o arquivo localmente para ser processardo no sidekiq
      File.write(import_data.path_file.to_s, file.read.force_encoding("UTF-8").encode!('UTF-8', 'UTF-8', invalid: :replace))
      #counta quantas linhas tem o arquivo
      count_row = (File.open(file.tempfile.path)&.count-9)
      #atualiza objeto
      import_data.update_column(:total, count_row)
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
