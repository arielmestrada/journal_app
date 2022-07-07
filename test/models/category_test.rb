require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def test_creating
    @category = Category.new
    assert @category.save
  end
end
