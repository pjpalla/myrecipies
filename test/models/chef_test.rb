require 'test_helper'
class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "cracco", email: "cracco@example.com")
    @chef.save
  end
  
  
  test "chef should be valid" do 
    assert @chef.valid?
  end
  
  test "chefname must be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chefname should not be too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  test "chefname should not be too long" do
    @chef.chefname = "a" * 100
    assert_not @chef.valid?
  end  
  
  test "email must be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "email should be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email should be unique" do
    @chef_obj = Chef.new(chefname: "cracco2", email: "cracco@example.com")
    @chef_obj.email = @chef_obj.email.upcase
    puts "email address: #{@chef_obj.email}"
    @chef_obj.save
    assert_not @chef_obj.valid?
    
  end  
  
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com piRR@aaa.com killo@ec.com lillo_aa@eeex.it]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, "#{va} should be valid"      
    end  
  end
  
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user.log.com @eca.com d@_x. lilli@..]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, "#{ia} should be invalid"
    end  
    
  end  
  
end  