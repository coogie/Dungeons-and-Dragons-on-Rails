class Character
  include MongoMapper::Document

  key :name, String
  key :level, Integer

  key :character_class_code, String
  key :character_race_code, String

  key :strength, Integer
  key :constitution, Integer
  key :dexterity, Integer
  key :intelligence, Integer
  key :wisdom, Integer
  key :charisma, Integer

  def initiative
    dexterity.modifier + level_bonus
  end

  def level_bonus
    level / 2
  end
end
