# GeoPoint Factory
**Generate useful, RGeo-compatible geographic points located within a supplied shapefile.**

## Quick Start
* Follow the [RGeo installation instructions](https://github.com/dazuma/rgeo) and install RGeo.

* `gem install geopoint_factory`

* Download an ESRI-compatible shapefile. ([Cartographic boundary files from the US Census](http://www.census.gov/geo/www/cob/bdy_files.html) are a convenient source for these.)

* Initialize an instance of GeoPointFactory::Generator with a shapefile and generate points:

```ruby
require 'geopoint_factory'

generator = GeoPointFactory::Generator.new("path/to/shapefile") # omit file extension
point_inside = generator.generate
different_point_inside = generator.generate
yet_another_point_inside = generator.generate
generator.finalize
```

* When done with a Generator instance, call #finalize.

## Discussion
GeoPoint Factory was developed as a way to easily generate geographic coordinate data within a specific geographic area, while avoiding areas that may not be useful, such as in the ocean.

For example, using the US Census-supplied shapefile of San Francisco's boundaries, GeoPoint Factory can generate random points specifically within San Francisco's borders and avoid generating points within the Pacific Ocean or San Francisco Bay.

GeoPoint Factory was developed for use with the [RGeo](https://github.com/dazuma/rgeo) library.

## Compatibility
* Ruby 1.9.2+

**Contributions, corrections, and improvements are always appreciated!**

## Created By
Josh Avant

## License
This is licensed under a MIT/Beerware License:

    Copyright (c) 2012 Josh Avant

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom the
    Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS IN THE SOFTWARE.

    If we meet some day, and you think this stuff is worth it, you can buy me a
    beer in return.