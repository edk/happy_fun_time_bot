class Dice
  AcceptableSides = [
    4, 6, 8, 10, 12, 20, 100
  ]
  
  def self.roll(from, args)
    matches = /(\d+)d(\d+)(.*)/.match(args)
    dice_count = $1.to_i
    sides = $2.to_i
    statement = $3
    return_val = "@" + from.split(" ").first + " "
    if dice_count <= 20 && AcceptableSides.include?(sides)
      dice_count.times do 
        return_val += rand(sides).to_s + " "
      end
      return_val += "=>" + statement
    else
      return_val = "I can't roll (allthethings)"
    end
    return_val
  end
end