class Character
  include MongoMapper::Document
  include DiceRolls

  key :name, String
  validates_presence_of :name

  key :level, Integer, default: 1
  validates_presence_of :level

  key :alignment, String

  key :size, String
  validates_presence_of :size

  key :description, String

  key :strength,     AbilityScore, default: 10
  key :constitution, AbilityScore, default: 10
  key :dexterity,    AbilityScore, default: 10
  key :intelligence, AbilityScore, default: 10
  key :wisdom,       AbilityScore, default: 10
  key :charisma,     AbilityScore, default: 10

  key :health_points, Integer
  key :armor_class, Integer
  key :speed, Integer

  key :languages, Array

  key :senses, Array

  def level_bonus
    level.to_i / 2
  end

  def bloodied_hp
    health_points.to_i / 2
  end

  # ability and skill checks
  def check(ability_or_skill)
    ability = (SKILLS[ability_or_skill] or ability_or_skill)

    self.send(ability).modifier + level_bonus
  end

  def fortitude
    10 + AbilityScore.new([strength.to_i, constitution.to_i].max).modifier
  end

  def reflex
    10 + AbilityScore.new([dexterity.to_i, intelligence.to_i].max).modifier
  end

  def will
    10 + AbilityScore.new([wisdom.to_i, charisma.to_i].max).modifier
  end

  def roll_initiative
    D(20) + check(:initiative)
  end
end
