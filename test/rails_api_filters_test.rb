require 'test_helper'

class RailsApiFiltersTest < ActionController::TestCase
  tests ArtistsController
  
  setup do
    @artist = Artist.create(name: "foo")
  end

  test "should return 404" do
    get :show, format: :json, id: "missing"
    assert_response :not_found
    assert_equal response.body, "Resource not found (404)"
  end
end
