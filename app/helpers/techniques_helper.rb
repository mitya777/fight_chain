module TechniquesHelper

  def getPositions
    ["takedown", "closed-guard", "open-guard", "half-guard", "side-mount", "mount", "north-South", "back-mount"]
  end

  def getSkills(position)
      positions = {
          "takedown" => ["grips", "offense", "defense"],
          "guard" => ["sweep/back-take", "pass", "submission"],
          "mount" => ["submission", "transition"]  
      }
      if position == "takedown" 
        position = "takedown"  
      elsif ["closed-guard", "open-guard", "half-Guard"].include? position 
        position = "guard"
      elsif ["side-mount", "mount", "north-south", "back-mount"].include? position 
        position = "mount" 
      end
      Rails.logger.debug position
      skills = positions[position] || ["empty"]
      skills.unshift ["- select -", ""]
  end

end
