require 'spec_helper'

describe "Sammiches" do
  describe "GET /sammiches" do
    it "display some sammiches" do
    	@sammich = Sammich.create :name => 'bacon'
    	visit sammiches_path
    	page.should have_content 'bacon'
    end

    it "creates a new sammich" do
    	visit sammiches_path
    	fill_in 'Sammich', :with => 'lechuga'
    	click_button 'add Sammich'

    	current_path.should = root_path
    	page.should have_content 'lechuga'

    	save_and_open_page
    end
  end
end
