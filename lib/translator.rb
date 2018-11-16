require "yaml"

def load_library(path)
  source_file = YAML.load_file(path)
  dictionary = {"get_meaning" => {}, "get_emoticon" => {}}
  source_file.each do |meaning,emoticons|
  	dictionary["get_emoticon"][emoticons[0]] = emoticons[1]
  	dictionary["get_meaning"][emoticons[1]] = meaning
	end
  dictionary
end

def get_japanese_emoticon(path, emoticon)
	dictionary = load_library(path)
	dictionary["get_emoticon"].fetch(emoticon, "Sorry, that emoticon was not found")
end

def get_english_meaning(path, emoticon)
  dictionary = load_library(path)
  dictionary["get_meaning"].fetch(emoticon, "Sorry, that emoticon was not found")
end
