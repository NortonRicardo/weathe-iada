require "application_system_test_case"

class WeatherDataTest < ApplicationSystemTestCase
  setup do
    @weather_datum = weather_data(:one)
  end

  test "visiting the index" do
    visit weather_data_url
    assert_selector "h1", text: "Weather Data"
  end

  test "creating a Weather datum" do
    visit weather_data_url
    click_on "New Weather Datum"

    fill_in "Data", with: @weather_datum.data
    fill_in "Hora", with: @weather_datum.hora
    fill_in "Prec total horario", with: @weather_datum.prec_total_horario
    fill_in "Pres atmos max", with: @weather_datum.pres_atmos_max
    fill_in "Pres atmos min", with: @weather_datum.pres_atmos_min
    fill_in "Pres atmos nivel estacao", with: @weather_datum.pres_atmos_nivel_estacao
    fill_in "Radiacao global", with: @weather_datum.radiacao_global
    fill_in "Temp ar bulso seco", with: @weather_datum.temp_ar_bulso_seco
    fill_in "Temp min hora ant", with: @weather_datum.temp_min_hora_ant
    fill_in "Temp monima hora ant", with: @weather_datum.temp_monima_hora_ant
    fill_in "Temp orvalho max hora ant", with: @weather_datum.temp_orvalho_max_hora_ant
    fill_in "Temp orvalho min hora ant", with: @weather_datum.temp_orvalho_min_hora_ant
    fill_in "Temp ponto orvalho", with: @weather_datum.temp_ponto_orvalho
    fill_in "Umid rel max hora ant", with: @weather_datum.umid_rel_max_hora_ant
    fill_in "Umid rel min hora ant", with: @weather_datum.umid_rel_min_hora_ant
    fill_in "Umid relativa ar", with: @weather_datum.umid_relativa_ar
    fill_in "Vento direcao horario", with: @weather_datum.vento_direcao_horario
    fill_in "Vento rajada maxima", with: @weather_datum.vento_rajada_maxima
    fill_in "Vento velocidade horario", with: @weather_datum.vento_velocidade_horario
    click_on "Create Weather datum"

    assert_text "Weather datum was successfully created"
    click_on "Back"
  end

  test "updating a Weather datum" do
    visit weather_data_url
    click_on "Edit", match: :first

    fill_in "Data", with: @weather_datum.data
    fill_in "Hora", with: @weather_datum.hora
    fill_in "Prec total horario", with: @weather_datum.prec_total_horario
    fill_in "Pres atmos max", with: @weather_datum.pres_atmos_max
    fill_in "Pres atmos min", with: @weather_datum.pres_atmos_min
    fill_in "Pres atmos nivel estacao", with: @weather_datum.pres_atmos_nivel_estacao
    fill_in "Radiacao global", with: @weather_datum.radiacao_global
    fill_in "Temp ar bulso seco", with: @weather_datum.temp_ar_bulso_seco
    fill_in "Temp min hora ant", with: @weather_datum.temp_min_hora_ant
    fill_in "Temp monima hora ant", with: @weather_datum.temp_monima_hora_ant
    fill_in "Temp orvalho max hora ant", with: @weather_datum.temp_orvalho_max_hora_ant
    fill_in "Temp orvalho min hora ant", with: @weather_datum.temp_orvalho_min_hora_ant
    fill_in "Temp ponto orvalho", with: @weather_datum.temp_ponto_orvalho
    fill_in "Umid rel max hora ant", with: @weather_datum.umid_rel_max_hora_ant
    fill_in "Umid rel min hora ant", with: @weather_datum.umid_rel_min_hora_ant
    fill_in "Umid relativa ar", with: @weather_datum.umid_relativa_ar
    fill_in "Vento direcao horario", with: @weather_datum.vento_direcao_horario
    fill_in "Vento rajada maxima", with: @weather_datum.vento_rajada_maxima
    fill_in "Vento velocidade horario", with: @weather_datum.vento_velocidade_horario
    click_on "Update Weather datum"

    assert_text "Weather datum was successfully updated"
    click_on "Back"
  end

  test "destroying a Weather datum" do
    visit weather_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weather datum was successfully destroyed"
  end
end
