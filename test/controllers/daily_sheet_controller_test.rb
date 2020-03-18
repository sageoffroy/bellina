require 'test_helper'

class DailySheetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_sheet_index_url
    assert_response :success
  end

end
