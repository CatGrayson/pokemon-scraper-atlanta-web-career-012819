class Scraper
  attr_accessor :file, :parsed_file, :all_pokemon, :db

  def initialize(db)
    self.db = db
    self.file = File.open("pokemon_index.html")
    self.parsed_file = Nokogiri::HTML.parse(file)
    self.all_pokemon = catch_em_all
  end

  # this method is necessary to make the solution cooler.
  def catch_em_all
    self.all_pokemon = parsed_file.css(".infocard-tall")
  end

  def get_pokemon_name_from(node)
    node.css(".ent-name").text
  end

  def get_pokemon_type_from(node)
    node.css(".itype").text
  end

end
