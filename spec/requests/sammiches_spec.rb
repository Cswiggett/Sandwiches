require 'spec_helper'

describe "Sammiches" do
  describe "GET /sammiches" do
    it "display some sammiches" do
    	visit sammiches_path
    	page.should have_content 'bacon'
    end
  end
end
