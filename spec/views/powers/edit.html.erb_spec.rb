require 'spec_helper'

describe "powers/edit.html.erb" do
  before(:each) do
    @power = assign(:power, stub_model(Power,
      :name => "MyString",
      :description => "MyString",
      :requirement => "MyString",
      :trigger => "MyString",
      :attack => "MyString",
      :hit => "MyString",
      :miss => "MyString",
      :effect => "MyString"
    ))
  end

  it "renders the edit power form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => powers_path(@power), :method => "post" do
      assert_select "input#power_name", :name => "power[name]"
      assert_select "input#power_description", :name => "power[description]"
      assert_select "input#power_requirement", :name => "power[requirement]"
      assert_select "input#power_trigger", :name => "power[trigger]"
      assert_select "input#power_attack", :name => "power[attack]"
      assert_select "input#power_hit", :name => "power[hit]"
      assert_select "input#power_miss", :name => "power[miss]"
      assert_select "input#power_effect", :name => "power[effect]"
    end
  end
end
