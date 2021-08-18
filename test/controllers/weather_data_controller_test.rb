require "test_helper"

class WeatherDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weather_datum = weather_data(:one)
  end

  test "should get index" do
    get weather_data_url
    assert_response :success
  end

  test "should get new" do
    get new_weather_datum_url
    assert_response :success
  end

  test "should create weather_datum" do
    assert_difference('WeatherDatum.count') do
      post weather_data_url, params: { weather_datum: { data: @weather_datum.data, hora: @weather_datum.hora, prec_total_horario: @weather_datum.prec_total_horario, pres_atmos_max: @weather_datum.pres_atmos_max, pres_atmos_min: @weather_datum.pres_atmos_min, pres_atmos_nivel_estacao: @weather_datum.pres_atmos_nivel_estacao, radiacao_global: @weather_datum.radiacao_global, temp_ar_bulso_seco: @weather_datum.temp_ar_bulso_seco, temp_min_hora_ant: @weather_datum.temp_min_hora_ant, temp_monima_hora_ant: @weather_datum.temp_monima_hora_ant, temp_orvalho_max_hora_ant: @weather_datum.temp_orvalho_max_hora_ant, temp_orvalho_min_hora_ant: @weather_datum.temp_orvalho_min_hora_ant, temp_ponto_orvalho: @weather_datum.temp_ponto_orvalho, umid_rel_max_hora_ant: @weather_datum.umid_rel_max_hora_ant, umid_rel_min_hora_ant: @weather_datum.umid_rel_min_hora_ant, umid_relativa_ar: @weather_datum.umid_relativa_ar, vento_direcao_horario: @weather_datum.vento_direcao_horario, vento_rajada_maxima: @weather_datum.vento_rajada_maxima, vento_velocidade_horario: @weather_datum.vento_velocidade_horario } }
    end

    assert_redirected_to weather_datum_url(WeatherDatum.last)
  end

  test "should show weather_datum" do
    get weather_datum_url(@weather_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_weather_datum_url(@weather_datum)
    assert_response :success
  end

  test "should update weather_datum" do
    patch weather_datum_url(@weather_datum), params: { weather_datum: { data: @weather_datum.data, hora: @weather_datum.hora, prec_total_horario: @weather_datum.prec_total_horario, pres_atmos_max: @weather_datum.pres_atmos_max, pres_atmos_min: @weather_datum.pres_atmos_min, pres_atmos_nivel_estacao: @weather_datum.pres_atmos_nivel_estacao, radiacao_global: @weather_datum.radiacao_global, temp_ar_bulso_seco: @weather_datum.temp_ar_bulso_seco, temp_min_hora_ant: @weather_datum.temp_min_hora_ant, temp_monima_hora_ant: @weather_datum.temp_monima_hora_ant, temp_orvalho_max_hora_ant: @weather_datum.temp_orvalho_max_hora_ant, temp_orvalho_min_hora_ant: @weather_datum.temp_orvalho_min_hora_ant, temp_ponto_orvalho: @weather_datum.temp_ponto_orvalho, umid_rel_max_hora_ant: @weather_datum.umid_rel_max_hora_ant, umid_rel_min_hora_ant: @weather_datum.umid_rel_min_hora_ant, umid_relativa_ar: @weather_datum.umid_relativa_ar, vento_direcao_horario: @weather_datum.vento_direcao_horario, vento_rajada_maxima: @weather_datum.vento_rajada_maxima, vento_velocidade_horario: @weather_datum.vento_velocidade_horario } }
    assert_redirected_to weather_datum_url(@weather_datum)
  end

  test "should destroy weather_datum" do
    assert_difference('WeatherDatum.count', -1) do
      delete weather_datum_url(@weather_datum)
    end

    assert_redirected_to weather_data_url
  end
end
