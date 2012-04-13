require "geopoint_factory/version"
require "rgeo/shapefile"

# USAGE NOTE:
# '#finalize' should be called, whenever you're done with an instance
# of GeoPointFactory::Generator

module GeoPointFactory
  class Generator
    # omit file extensions for `path_to_shapefile`
    def initialize(path_to_shapefile)
      @factory = RGeo::Geographic.simple_mercator_factory
      @shapefile = RGeo::Shapefile::Reader.open(path_to_shapefile, :factory => @factory)
    end
    
    def generate
      begin
        generated_point = random_point_in_bounding_box
      end while !@shapefile.get(0).geometry.contains?(generated_point)
      generated_point
    end
    
    def finalize
      @shapefile.close
    end
    
    private
    def convert_to_rad(deg)
      (deg / 360) * (2 * Math::PI)
    end
    
    def convert_to_deg(rad)
      (rad * 360) / (2 * Math::PI)
    end
    
    def random_point_in_bounding_box
      northlimit = convert_to_rad(@shapefile.ymax)
      southlimit = convert_to_rad(@shapefile.ymin)
      westlimit = convert_to_rad(@shapefile.xmin)
      eastlimit = convert_to_rad(@shapefile.xmax)

      # source:   http://www.geomidpoint.com/random/calculation.html
      # section: 'Rectangular region calculation detail'
      rand_lat = Math.asin(rand * (Math.sin(northlimit) - Math.sin(southlimit)) + Math.sin(southlimit))

      width = eastlimit - westlimit
      
      if width < 0
        width = width + (2 * Math::PI)
      end
      
      rand_lon = westlimit + width * rand
      
      if rand_lon < -Math::PI
        rand_lon = rand_lon + 2 * Math::PI
      elsif rand_lon > Math::PI
        rand_lon = rand_lon - 2 * Math::PI
      end
      
      rand_lat = convert_to_deg(rand_lat)
      rand_lon = convert_to_deg(rand_lon)
            
      @factory.point(rand_lon, rand_lat)
    end
    
  end
end
