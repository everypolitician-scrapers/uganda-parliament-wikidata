#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

en_9 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/List_of_members_of_the_ninth_Parliament_of_Uganda',
  after: '//span[@id="List_of_members"]',
  before: '//span[@id="References"]',
  xpath: '//table//td[1]//a[not(@class="new")]/@title',
) 

en_10 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/List_of_members_of_the_tenth_Parliament_of_Uganda',
  after: '//span[@id="List_of_members"]',
  before: '//span[@id="References"]',
  xpath: '//table//td[1]//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { en: en_9 | en_10 })

