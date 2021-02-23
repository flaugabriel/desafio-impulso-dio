require "application_system_test_case"

class CnabsTest < ApplicationSystemTestCase
  setup do
    @cnab = cnabs(:one)
  end

  test "visiting the index" do
    visit cnabs_url
    assert_selector "h1", text: "Cnabs"
  end

  test "creating a Cnab" do
    visit cnabs_url
    click_on "New Cnab"

    fill_in "Card", with: @cnab.card
    fill_in "Cpf", with: @cnab.cpf
    fill_in "Date occurrence", with: @cnab.date_occurrence
    fill_in "Hours", with: @cnab.hours
    fill_in "Store name", with: @cnab.store_name
    fill_in "Store owner", with: @cnab.store_owner
    fill_in "Transactions", with: @cnab.transactions_id
    fill_in "Type", with: @cnab.type
    fill_in "Value", with: @cnab.value
    click_on "Create Cnab"

    assert_text "Cnab was successfully created"
    click_on "Back"
  end

  test "updating a Cnab" do
    visit cnabs_url
    click_on "Edit", match: :first

    fill_in "Card", with: @cnab.card
    fill_in "Cpf", with: @cnab.cpf
    fill_in "Date occurrence", with: @cnab.date_occurrence
    fill_in "Hours", with: @cnab.hours
    fill_in "Store name", with: @cnab.store_name
    fill_in "Store owner", with: @cnab.store_owner
    fill_in "Transactions", with: @cnab.transactions_id
    fill_in "Type", with: @cnab.type
    fill_in "Value", with: @cnab.value
    click_on "Update Cnab"

    assert_text "Cnab was successfully updated"
    click_on "Back"
  end

  test "destroying a Cnab" do
    visit cnabs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cnab was successfully destroyed"
  end
end
