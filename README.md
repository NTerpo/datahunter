# Hunter

![screenshot](./logo.png)

## Hunter 

[![Gem Version](https://badge.fury.io/rb/datahunter.svg)](http://badge.fury.io/rb/datahunter) [![Build Status](https://travis-ci.org/NTerpo/datahunter.svg?branch=master)](https://travis-ci.org/NTerpo/datahunter)

**Hunter allows you to find and download open datasets quickly and easily from your terminal**.

We work hard to index and sort the most useful datasets available for you!

In a world where there are more and more data publishers and data users, the research of those data is still a pain.
Our aim with Hunter is to help publishers seeing their data reused and to help data users to find them quicker than ever and to handle them easily.

We believe that pre-processing data is a bad idea and that hosting them could create problems for data users. We just want to show you the way to the data you want as faster as possible!


## Installation

    $ gem install datahunter

## Usage

### $ hunter find

    $ hunter find consumer
    ### Response in 0.894806 seconds
    ### We've found 34 datasets corresponding to your query consumer:
    
    1. Consumer Complaint Database id: 54de229aa82653913d1142ee
    ["us", "usa", "america", "united states", "united-states"]
    These are complaints we’ve received about financial products and services.
    2. Consumer Expenditure Survey id: 54de229ba82653913d1142f8
    ["us", "usa", "america", "united states", "united-states"]
    The Consumer Expenditure Survey (CE) program consists of two surveys, the quarterly Interview ...
    3. Farmers Markets Geographic Data id: 54de229ba82653913d1142fe
    ["us", "usa", "america", "united states", "united-states"]
    longitude and latitude, state, address, name, and zip code of Farmers Markets in the United ...
    4. Consumer Price Indices id: 54e8c7dfa8268b5c235ac352
    ["england", "scotland", "wales", "northern_ireland"]
    Contains price indices, percentage changes and weights for the Consumer Prices Index (CPI), Retail ...
    5. Organogram and staff pay data for the Consumer Council for Water id: 54e8c872a8268b5c235ac5d9
    ["uk", "england", "scotland", "wales", "ireland"]
    A list of most Senior Civil Service posts in the Consumer Council for Water including title, ...
    
    ### GET A DATASET ? (1/..5), show next 5 datasets? (RET) or abort? (abort)
    1
    0. Consumer Complaint Database - CSV
    1. Consumer Complaint Database - JSON
    2. Consumer Complaint Database - XML
    3. Consumer Complaint Database - api
    ### which one? (0/1/...)
    1
    Create/overwrite /Users/Terpolilli/views.json?(y/rename/n)
    y
    Start downloading...
    Your file has been downloaded ;)
    If this is not the file you expected, it's maybe because publisher don't always keep the metadata up-to-date. We try to clean most of uri's and check the url. Anyway you may be able to download your file by hand here:
    https://data.consumerfinance.gov/api/views/x94z-ydhh/rows.csv?accessType=DOWNLOAD

### $ hunter info

    $ hunter info 54de229aa82653913d1142ee

    Consumer Complaint Database
    These are complaints we’ve received about financial products and services.
    
    publisher: Consumer Financial Protection Bureau
    temporal: ["2011", "2012", "2013"]
    spatial: ["us", "usa", "america", "united states", "united-states", "united states of america", "united-states-of-america", "world", "countries", "all"]
    created: 2014-02-25T18:48:25.000Z
    updated: 2015-01-30T15:16:28.000Z
    score: 26.683

### $ hunter get 

    $ hunter get 548c82a7a826dfe85070e5fa
    
    0. Consumer Complaint Database - CSV
    1. Consumer Complaint Database - JSON
    2. Consumer Complaint Database - XML
    ### which one? (0/1/...)
    1
    ### Create/overwrite /Users/Terpolilli/views.json?(y/rename/n)
    rename
    Path/to/filename: /Users/Terpolilli/Downloads/consumer-data.json
    ### Start downloading...
    ### Your file has been downloaded ;)
    If this is not the file you expected, it's maybe because publisher don't always keep the metadata up-to-date. We try to clean most of uri's and check the url. Anyway you may be able to download your file by hand here:
    https://data.consumerfinance.gov/api/views/x94z-ydhh/rows.csv?accessType=DOWNLOAD

## Feedbacks
Don't hesitate to [give us any feedback about you experience with Hunter!](https://docs.google.com/forms/d/1yNzZjCCXvWHQCbWz4sx-nui3LafeeLcT7FF9T-vbKvw/viewform?usp=send_form)

## Update

* datasets indexed: 8336
* last datasets indexed: Canada open data, NETL's Energy Data eXchange, dati.gov.it, complete french health DAMIR data.

## Roadmap

* more datasets
* improve the download of datasets
* searched and downloaded data management
* more generic lib to make the API more easy to reuse

## Contributing

1. Fork it ( https://github.com/nterpo/datahunter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Copyright (c) 2014 Terpolilli

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
