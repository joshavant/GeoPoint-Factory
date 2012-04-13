require 'spec_helper'

PATH_TO_TEST_SHAPEFILE = "spec/support/sf_shapefile"

describe GeoPointFactory::Generator do
  before(:all) do
    @point_generator = GeoPointFactory::Generator.new(PATH_TO_TEST_SHAPEFILE)
    @point = @point_generator.generate
  end

  it "should generate a RGeo::Feature::Point module" do
    RGeo::Feature::Point.check_type(@point).should be_true
  end
  
  it "should generate random points with different locations" do
    second_point = @point_generator.generate
    @point.eql?(second_point).should be_false
  end

  it "should generate a point within the bounds of the supplied shapefile" do
    factory = RGeo::Geographic.simple_mercator_factory
    shapefile = RGeo::Shapefile::Reader.open(PATH_TO_TEST_SHAPEFILE, :factory => factory)
    shapefile.get(0).geometry.contains?(@point).should be_true
  end
  
  after(:all) do
    @point_generator.finalize
  end
end
