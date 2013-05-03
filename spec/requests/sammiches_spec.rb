require 'spec_helper'

describe "Sammiches" do
  describe "GET /sammiches" do
    it "display some sammiches" do
    	@sammich = Sammich.create :name => 'lechuga'
    	visit sammiches_path
    	page.should have_content 'lechuga'
    end

    it "finds a sammich by name" do
    	visit sammiches_path
    	fill_in 'sammich_name', :with => 'Bacon'
    	click_button 'sammich_submit'

    	current_path.should == sammiches_path
    	page.should have_content 'Bacon'

    	save_and_open_page
    end

    it "finds a random sammich" do
    	visit sammiches_path
    	
  end
end
