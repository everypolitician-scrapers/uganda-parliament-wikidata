#!/bin/env ruby
# encoding: utf-8

require 'everypolitician'
require 'wikidata/fetcher'

existing = EveryPolitician::Index.new.country("Uganda").lower_house.popolo.persons.map(&:wikidata).compact

en_9 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/List_of_members_of_the_ninth_Parliament_of_Uganda',
  after: '//span[@id="Elected_members"]',
  before: '//span[@id="Ex_officio_members"]',
  xpath: '//table//td[1]//a[not(@class="new")]/@title',
)

en_10 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/List_of_members_of_the_tenth_Parliament_of_Uganda',
  after: '//span[@id="List_of_members"]',
  before: '//span[@id="References"]',
  xpath: '//table//td[1]//a[not(@class="new")]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(ids: existing, names: { en: en_9 | en_10 })

