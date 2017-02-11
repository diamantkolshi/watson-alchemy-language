# AlchemyLanguage

AlchemyLanguage is a collection of APIs that offer text analysis through natural language processing. This set of APIs can analyze text to help you understand its concepts, entities, keywords, sentiment, and more. Additionally, you can create a custom model for some APIs to get specific results that are tailored to your domain.

Ruby client library to quickly get started with the various Alchemy Language services.

## Prerequisites
You authenticate to the AlchemyLanguage API by passing an API key as a query parameter in each call.

To get an API key, you'll need to [sign up for IBM Bluemix](https://console.ng.bluemix.net/registration/). After you create an account:

Log in to Bluemix and go to the AlchemyAPI service page.
Click the "Create" button.
Click the "Service Credentials" button from the AlchemyAPI page in your Bluemix dashboard to view your API key.

## Getting Started in ruby
You can install this library

`gem install 'alchemy_language'`

and use

```ruby
require 'alchemy_language'
```

## Getting Started in Rails
AlchemyLanguage works with Rails > 4.1 onwards. You can add it to your Gemfile with:

```ruby
gem 'alchemy_language'
```

Then run `bundle install`

## Use

### Service
  Alchemy Language provide three kind of service
  
  Url service
  Text service
  HTML service

## Url service 
  
  Use UrlSevice module to create take result alchemy Url Sevice

  ```ruby
  url = 'https://www.ibm.com/us-en/'
  alchemy_object = AlchemyLanguage::UrlService.new("http://www.ibm.com/watson/")
  ```
## Authors

Authors - extracts author information from news articles or blog posts. Author extraction enables the categorization of content from online publications by author, and can be used with other AlchemyLanguage functions to generate tag clouds, identify sentiment towards topics and authors, and so on.

Fetch all result of author model

```ruby
  alchemy_object.author.result
  ```
  
## Concepts

Concepts - identifes concepts with which the input text is associated, based on other concepts and entities that are present in that text. Concept-related API functions understand how concepts relate, and can identify concepts that are not directly referenced in the text. For example, if an article mentions CERN and the Higgs boson, the Concepts API functions will identify Large Hadron Collider as a concept even if that term is not mentioned explicitly in the page. Concept tagging enables higher level analysis of input content than just basic keyword identification.

Fetch all result of Concepts model

```ruby
  alchemy_object.concept.result
  ```
  
## Dates

Dates - extracts natural language date/time expressions from text, normalizes them to an ISO date string (such as "20040104T000000"), and identifies concepts with which those dates are associated.

Fetch all result of Dates model

```ruby
  alchemy_object.date_extraction.result
  ```
 
## Emotion Analysis

Emotion Analysis - detects anger, disgust, fear, joy, and sadness implied in English text. Emotion Analysis can detect emotions that are associated with targeted phrases, entities, or keywords, or it can analyze the overall emotional tone of your content.

Fetch all result of Emotion Analysis model

```ruby
  alchemy_object.emotion_analysis.result
  ```
  
## Entities

Entities - returns items such as persons, places, and organizations that are present in the input text. Entity extraction adds semantic knowledge to content to help understand the subject and context of the text that is being analyzed. The entity extraction technniques used by the AlchemyLanguage service are based on sophisticated statistical algorithms and natural language processing technology, and are unique in the industry with their support for multilingual analysis, context-sensitive disambiguation, and quotations extraction. You can specify a custom model in your request to identify a custom set of entity types in your content, enabling domain-specific entity extraction.

Fetch all result of Entities model

```ruby
  alchemy_object.entity.result
  ```
  
## Feeds

Feeds - extracts any links to web feeds that are embedded in a web page. Web feeds are often embedded in websites to enable automated access to syndicated content. Any feeds that are detected can subsequently be used to discover new content, such as blog posts, news articles, and comment streams.

Fetch all result of Feeds model

```ruby
  alchemy_object.feed_detection.result
  ```

## Keywords

Keywords - important topics in your content that are typically used when indexing data, generating tag clouds, or when searching. The AlchemyLanguage service automatically identifies supported languages (see the next bullet) in your input content, and then identifies and ranks keywords in that content. Sentiment can also be associated with each keyword by using the AlchemyLanguage sentiment analysis capabilities.

Fetch all result of Keywords model

```ruby
  alchemy_object.keyword.result
  ```

## Language

Language - detects the natural language in which input text, HTML, or web-based content is written. Language identification functions can identify English, German, French, Italian, Portuguese, Russian, Spanish and Swedish. These functions enable applications to categorize or filter content based on the language in which it was written.

Fetch all result of Language model

```ruby
  alchemy_object.language_detection.result
  ```

## Microformats

Microformats - processes microformat information that is included in the HTML of some webpages to add semantic information and to enable easier scanning and processing of those pages by software. The information extracted from web pages by the Microformats method can be used for tasks such as webpage categorization and content discovery.

Fetch all result of Microformats model

```ruby
  alchemy_object.microformat.result
  ```

## Publication Date

Publication Date - extracts publication date information, if present, from web pages. The date on which a web page was published can be critical when analyzing trends based on text attributes, such as when tracking changing sentiment towards specific topics, products, or brands. The Publication Date API functions understand most date formats, can identify publication dates in different portions of a document, and can differentiate between the publication date of a page and other dates that may be embedded in its content.

Fetch all result of Publication Date model

```ruby
  alchemy_object.publication_date.result
  ```

## Relations

Relations - identifies subject, action, and object relations within sentences in the input content. After parsing sentences into subject, action, and object form, the Relation Extraction API functions can use this information for subsequent processing by other AlchemyLanguage functions such as entity extraction, keyword extraction, sentiment analysis, and location identification. Relation information can be used to automatically identify buying signals, key events, and other important actions.

Fetch all result of Relations model

```ruby
  alchemy_object.relation.result
  ```
  
## Typed Relations

Typed Relations - uses custom models to recognize entities in content, and identifies various types of relations between those entities. The types of entities and relations that can be identified are properties of the custom model that is specified. With the public custom model ie-en-news, Typed Relations can identify entities and relations related to the news domain. For example, given the input "Leonardo DiCaprio won an Oscar," a request using ie-en-news will recognize "Leonardo Dicaprio" as a "Person" entity and "Oscar" as an "EntertainmentAward" entity, and it will recognize an "awardedTo" relation that exists between those entities.

Fetch all result of Typed Relations model

```ruby
  alchemy_object.typed_relation.result
  ```
  
## Sentiment

Sentiment - identifies attitude, opinions, or feelings in the content that is being analyzed. The AlchemyLanguage service can calculate overall sentiment within a document, sentiment for user-specified targets, entity-level sentiment, quotation-level sentiment, directional-sentiment, and keyword-level sentiment. The combination of these capabilities supports a variety of use cases ranging from social media monitoring to trend analysis.


Fetch all result of Sentiment model

```ruby
  alchemy_object.sentiment_analysis.result
  ```

## Taxonomy

Taxonomy - categorizes input text, HTML or web-based content into a hierarchical taxonomy up to five levels deep. Deeper levels allow you to classify content into more accurate and useful subsegments. The AlchemyLanguage taxonomy methods use an enhanced version of the standard Interactive Advertising Bureau Quality Assurance Guidelines Taxonomy, extending that taxonomy to over 1000 categories for superior audience targeting and information routing.

Fetch all result of Taxonomy model

```ruby
  alchemy_object.taxonomy.result
  ```

## Text Extraction

Text Extraction - AlchemyLanguage cleans source text from html in each API method by default. This includes normalizing HTML content, removing ads, navigation links, and other unimportant content so that only the important page text is returned.

Fetch all result of Text Extraction model

Text (cleaned)
```ruby
  alchemy_object.text.result
  ```

Text (raw)
```ruby
  alchemy_object.raw_text.result
  ```
  
## Title Extraction

Title Extraction - Extracts title information from web pages

Fetch all result of Title Extraction model

```ruby
  alchemy_object.title_extraction.result
  ```
Title Extraction - Extracts title information from web pages.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
