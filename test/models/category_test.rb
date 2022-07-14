require "test_helper"

class CategoryTest < ActiveSupport::TestCase
=begin
  def test_creating
    @category = Category.new
    assert @category.save
    
  end

  def test_task_association
    @category = Category.create(name: "Personal")

    assert_equal @category.tasks.length, 0
  end
=end
end
