require "pry"
# require modules here
require 'yaml'
yaml_path = "./lib/emoticons.yml"

def load_library(yaml_path)
  # code goes here
  emoticon_hash = YAML.load_file(yaml_path)
  return_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticon_hash.each do |name, emoticons|
      return_hash["get_emoticon"][emoticons[0]] = emoticons[1]
      return_hash["get_meaning"][emoticons[1]] = name
    end
  return_hash
end

def get_japanese_emoticon(yaml_path, emoticon)
    emoticon_hash = load_library(yaml_path)
    if emoticon_hash["get_emoticon"].keys.include?(emoticon)
      return emoticon_hash["get_emoticon"][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(yaml_path, emoticon)
    emoticon_hash = load_library(yaml_path)
    if emoticon_hash["get_meaning"].keys.include?(emoticon)
      return emoticon_hash["get_meaning"][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
end
