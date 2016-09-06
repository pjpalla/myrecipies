require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  ##Before any test we have to create a recipe object
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "chicken parm", summary: "this is the best chicken parm recipe ever", description: "heat oil, add onions, 
     add tomato sauce, add chicken, cook for 20 minutes")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end  
  
  test "name shoud be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do 
    @recipe.name = "a"*110
    assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    @recipe.name = "abcd"
    assert_not @recipe.valid?
  end
  
  test "summary shoud be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end
  
  test "summary lenght should not be too long" do
    @recipe.summary = "v"*160
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too short" do
    @recipe.summary = "v"*9
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end
  
  test "description length should not be too long" do
    @recipe.description = "v"*600
    assert_not @recipe.valid?
  end
  
  test "description lenght should not be too short" do
    @recipe.description = "w"*4
    assert_not @recipe.valid?
  end  
  
  
  
  
  
end