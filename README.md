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
    ### Response in 0.783677 seconds
    ### Looks like we've got something for you!
    
    title: Consumer Complaint Database
    description: These are complaints we’ve received about financial products and services.
    publisher: Consumer Financial Protection Bureau
    temporal: ["2011", "2012", "2013"]
    spatial: ["us", "usa", "america", "united states", "united-states", "united states of america", "united-states-of-america", "world", "countries", "all"]
    created: 2014-02-25T18:48:25.192Z
    updated: 2014-02-25T23:48:24.897Z
    score: 20.743
    
    ### get the data? (y/n)
    y
    0. Consumer Complaint Database - CSV
    1. Consumer Complaint Database - JSON
    2. Consumer Complaint Database - XML
    ### which one? (0/1/...)
    0
    Start downloading...
    Your file has been downloaded, try to $ ls ;D
    If this is not the file you expected, it's maybe because publisher don't always keep the metadata up-to-date. We try to clean most of uri's and check the url. Anyway you may be able to download your file by hand here:
    https://data.consumerfinance.gov/api/views/x94z-ydhh/rows.csv?accessType=DOWNLOAD

![usage](./hunter.gif)

### $ hunter search

    $ hunter search consumer
    ### Response in 0.402504 seconds
    ### We've found 12 datasets corresponding to your query consumer:

    - Consumer Complaint Database id: 548c82a7a826dfe85070e5fa
    - Consumer Expenditure Survey id: 548c82a9a826dfe85070e607
    - Farmers Markets Geographic Data id: 548c82aaa826dfe85070e60e
    - Food Price Outlook id: 548c82aba826dfe85070e624
    - Consumer Price Index id: 548c82fca826dfe85070e79f
    - Foreign Labor Statistics id: 548c82ada826dfe85070e663
    - Farmers Markets Search id: 548c82b1a826dfe85070e6f2
    - International Macroeconomic Data Set id: 548c8301a826dfe85070e84e
    - Consumer Expenditure Survey id: 548c82fba826dfe85070e782
    - Consumer Price Indexes - Base id: 548c82fca826dfe85070e7b5
    - Consumer Price Index - Department Store Inventory Price Index id: 548c82fea826dfe85070e7f4
    - Southeast Information Office id: 548c8305a826dfe85070e8cf
    
    You can get more informations about a dataset with $ hunter info <id>
    You can download directly a dataset with $ hunter get <id>
    
### $ hunter info

    $ hunter info 548c82a7a826dfe85070e5fa
    
    title: Consumer Complaint Database
    description: These are complaints we’ve received about financial products and services.
    publisher: Consumer Financial Protection Bureau
    temporal: ["2011", "2012", "2013"]
    spatial: ["us", "usa", "america", "united states", "united-states", "united states of america", "united-states-of-america", "world", "countries", "all"]
    created: 2014-02-25T18:48:25.192Z
    updated: 2014-02-25T23:48:24.897Z
    score: 20.743
    
### $ hunter get 

    $ hunter get 548c82a7a826dfe85070e5fa
    
    0. Consumer Complaint Database - CSV
    1. Consumer Complaint Database - JSON
    2. Consumer Complaint Database - XML
    ### which one? (0/1/...)
    1
    Create/overwrite /Users/Terpolilli/views.json?(y/rename/n)
    rename
    Path/to/filename: /Users/Terpolilli/Downloads/consumer-data.json
    Start downloading...
    Your file has been downloaded ;)
    If this is not the file you expected, it's maybe because publisher don't always keep the metadata up-to-date. We try to clean most of uri's and check the url. Anyway you may be able to download your file by hand here:
    https://data.consumerfinance.gov/api/views/x94z-ydhh/rows.csv?accessType=DOWNLOAD

## Feedbacks
Don't hesitate to [give us any feedback about you experience with Hunter!](https://docs.google.com/forms/d/1yNzZjCCXvWHQCbWz4sx-nui3LafeeLcT7FF9T-vbKvw/viewform?usp=send_form)

## Update

* datasets indexed: 6335
* last datasets indexed: Canada open data

## Roadmap

* more datasets
* improve the download of datasets
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
