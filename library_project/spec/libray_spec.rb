require 'spec_helper'

describe "Library Object" do 
      before :all do
         lib_arr=[
             Book.new("Jack is rich","Jack",:success),
             Book.new("Andy is cool","Andy", :cool),
             Book.new("Jack likes BS","Jack",:success),
             Book.new("Andy hates detail","Andy",:development),
         ]

       File.open "book.yml","w" do |f|
           f.write YAML::dump lib_arr
           end
	   end

	   before :each do
	      @lib=Library.new "books.yml"
	   end

	   describe "#new" do
	     context "with no parameters" do
	        it "has no books" do
	             lib=Library.new
	             lib.should have(0).books
	        end
	     end

	     context "with a yaml file name parameter" do
	        it "has five books" do
	          @lib.should have(5).books
	        end
	     end



end