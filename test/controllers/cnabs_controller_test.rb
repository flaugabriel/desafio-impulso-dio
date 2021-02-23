require "test_helper"

class CnabsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cnab = cnabs(:one)
  end

  test "should get index" do
    get cnabs_url
    assert_response :success
  end

  test "should get new" do
    get new_cnab_url
    assert_response :success
  end

  test "should create cnab" do
    assert_difference('Cnab.count') do
      post cnabs_url, params: { cnab: { card: @cnab.card, cpf: @cnab.cpf, date_occurrence: @cnab.date_occurrence, hours: @cnab.hours, store_name: @cnab.store_name, store_owner: @cnab.store_owner, transactions_id: @cnab.transactions_id, type: @cnab.type, value: @cnab.value } }
    end

    assert_redirected_to cnab_url(Cnab.last)
  end

  test "should show cnab" do
    get cnab_url(@cnab)
    assert_response :success
  end

  test "should get edit" do
    get edit_cnab_url(@cnab)
    assert_response :success
  end

  test "should update cnab" do
    patch cnab_url(@cnab), params: { cnab: { card: @cnab.card, cpf: @cnab.cpf, date_occurrence: @cnab.date_occurrence, hours: @cnab.hours, store_name: @cnab.store_name, store_owner: @cnab.store_owner, transactions_id: @cnab.transactions_id, type: @cnab.type, value: @cnab.value } }
    assert_redirected_to cnab_url(@cnab)
  end

  test "should destroy cnab" do
    assert_difference('Cnab.count', -1) do
      delete cnab_url(@cnab)
    end

    assert_redirected_to cnabs_url
  end
end
