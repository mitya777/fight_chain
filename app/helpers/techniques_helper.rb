module TechniquesHelper

  def getPositions
    positions = Tag.default_tags.select {|tag| tag[:kind] == "position"} 
    positions.map {|position| position[:name]}
  end

  def getSkills(position)
      positions = {
          "standup" => ["grips", "takedown", "takedown defense", "submission"],
          "guard" => ["sweep", "back take", "pass", "submission"],
          "mount" => ["submission", "transition"]  
      }
      #map position to the appropriate skills
      logger.debug position
      logger.debug position.split(" ").inspect
      if position.split(" ").include? "guard"
        position = "guard"
      else 
        position = "mount" unless position == "standup" 
      end
      logger.debug position
      skills = positions[position] || ["empty"]
      skills.unshift ["- select -", ""]
  end

end
