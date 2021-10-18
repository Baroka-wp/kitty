require "test_helper"

class CatalogueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get catalogue_index_url
    assert_response :success
  end
end
