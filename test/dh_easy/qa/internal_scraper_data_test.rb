require 'test_helper'

describe DhEasy::Qa::Validator do
  describe "internal scraper data tests" do
    it 'should test internal scraper output' do
      qa = DhEasy::Qa::Validator.new
      qa.config = {"scrapers"=>{"amazon-tvs"=>["products"]}, "individual_validations"=>{}}
      qa.validate_internal({}, [])
    end
  end
end
