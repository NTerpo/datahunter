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

## Version

Hunter is currently `0.4.xx`

Be careful every version before `0.4.0` **won't work** since the Hunter API has changed and now use Elastic Search.

## Usage

### $ hunter find

    $ hunter find consumer
    ### Response in 0.266687 seconds
    ### We've found 14 datasets corresponding to your query 'consumer':
    
    1. Consumer Complaint Database id: AUzHZIcnlutSVlmd6y27
    ["us", "usa", "america", "united states"]
    These are complaints we’ve received about financial products and services.
    2. Farmers Markets Geographic Data id: AUzHZJZilutSVlmd6y3K
    ["us", "usa", "america", "united states"]
    longitude and latitude, state, address, name, and zip code of Farmers Markets in the United ...
    3. Food Price Outlook id: AUzHZKVglutSVlmd6y3Z
    ["us", "usa", "america", "united states"]
    The Consumer Price Index (CPI) for food is a component of the all-items CPI. The CPI measures the ...
    4. All Product Recalls id: AUzHZLOplutSVlmd6y3o
    ["us", "usa", "america", "united states"]
    Recalls and product safety news. CPSC is charged with protecting the public from unreasonable risks ...
    5. SaferProducts API id: AUzHZPzclutSVlmd6y4x
    ["us", "usa", "america", "united states"]
    On March 11, 2011, the U.S. Consumer Product Safety Commission launched SaferProducts.gov. This ...
    
    ### Get data? (1..5) Show next 5 datasets? (RET) abort? (q)
    > 1
    0. Consumer Complaint Database - CSV
    1. Consumer Complaint Database - JSON
    2. Consumer Complaint Database - XML
    3. Consumer Complaint Database - api
    ### which one? (0/1/...)
    > 1
    ### Create/overwrite /Users/my_project/views.json? (RET) Rename? (r) abort? (q)
    >
    ### Start downloading...
    ### Your file has been downloaded ;)
    
![demo](hunter.gif)

### $ hunter info

    $ hunter info AUzHZIcnlutSVlmd6y27
    
    Consumer Complaint Database
    These are complaints we’ve received about financial products and services.
    
    publisher: Consumer Financial Protection Bureau
    temporal: ["2011", "2012", "2013"]
    spatial: ["us", "usa", "america", "united states"]
    created: 2014-02-25T19:48:25:192000
    updated: 2015-03-13T01:32:35:438000
    score: 35.119

### $ hunter get

    $ bin/hunter get AUzHZIcnlutSVlmd6y27

    0. Consumer Complaint Database - CSV
    1. Consumer Complaint Database - JSON
    2. Consumer Complaint Database - XML
    3. Consumer Complaint Database - api
    ### which one? (0/1/...)
    > 1
    ### Create/overwrite /Users/Terpolilli/Documents/Sites/datahunter/views.json? (RET) Rename? (r) abort? (q)
    >
    ### Start downloading...
    ### Your file has been downloaded ;)
    If this is not the file you expected, it's maybe because publisher don't always keep the metadata up-to-date. We try to clean most of uri's and check the url. Anyway you may be able to download your file by hand here:
    https://data.consumerfinance.gov/api/views/x94z-ydhh/rows.csv?accessType=DOWNLOAD

## Feedbacks
Don't hesitate to [give us any feedback about you experience with Hunter!](https://docs.google.com/forms/d/1yNzZjCCXvWHQCbWz4sx-nui3LafeeLcT7FF9T-vbKvw/viewform?usp=send_form)

## Update

* datasets indexed: 8336 (temporaly only ~2000 are available)
* last datasets indexed: Canada open data, NETL's Energy Data eXchange, dati.gov.it, complete french health DAMIR data.

## Change Log

* 0.4.x - Adapted to the new Hunter API version (based on ElasticSearch)
* 0.3.x - Merge `$ hunter find <keyword>` and `$ hunter search <keyword>` commands.
The new `$ hunter find` command displays the datasets corresponding to the query, 5 by 5,
sorted by popularity
* 0.2.x - New feature: download datasets directly from the CLI 
* 0.1.x 

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
