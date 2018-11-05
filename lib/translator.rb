require "yaml"
require 'pry'

def load_library(path)
  emotes = YAML.load_file(path)
  
  emotes_hash  = {}
  emotes_hash["get_meaning"] = {}
  emotes_hash["get_emoticon"] = {}
  
  emotes.each do |meaning, emote|
    emotes_hash["get_meaning"][emote.last] = meaning
    emotes_hash["get_emoticon"][emote.first] = emote.last
    
  end
  return emotes_hash
  
end

def get_japanese_emoticon(path, emote)
  emoticon_dictionary = load_library(path)
  if emoticon_dictionary["get_emoticon"].has_key?(emote)
    return emoticon_dictionary["get_emoticon"][emote]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emote)
  emoticon_dictionary = load_library(path)
  if emoticon_dictionary["get_meaning"].has_key?(emote)
    return emoticon_dictionary["get_meaning"][emote]
  else
    return "Sorry, that emoticon was not found"
  end
end