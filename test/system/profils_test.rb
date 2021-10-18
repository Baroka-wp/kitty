require "application_system_test_case"

class ProfilsTest < ApplicationSystemTestCase
  setup do
    @profil = profils(:one)
  end

  test "visiting the index" do
    visit profils_url
    assert_selector "h1", text: "Profils"
  end

  test "creating a Profil" do
    visit profils_url
    click_on "New Profil"

    fill_in "Bio", with: @profil.bio
    fill_in "Doc type", with: @profil.doc_type
    fill_in "Document", with: @profil.document
    fill_in "Name", with: @profil.name
    fill_in "Status", with: @profil.status
    fill_in "Telephone", with: @profil.telephone
    fill_in "User", with: @profil.user
    click_on "Create Profil"

    assert_text "Profil was successfully created"
    click_on "Back"
  end

  test "updating a Profil" do
    visit profils_url
    click_on "Edit", match: :first

    fill_in "Bio", with: @profil.bio
    fill_in "Doc type", with: @profil.doc_type
    fill_in "Document", with: @profil.document
    fill_in "Name", with: @profil.name
    fill_in "Status", with: @profil.status
    fill_in "Telephone", with: @profil.telephone
    fill_in "User", with: @profil.user
    click_on "Update Profil"

    assert_text "Profil was successfully updated"
    click_on "Back"
  end

  test "destroying a Profil" do
    visit profils_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profil was successfully destroyed"
  end
end
