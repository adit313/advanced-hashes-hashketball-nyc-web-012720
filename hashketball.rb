# Write your code here!

def game_hash
  result={
    
  home: {
    team_name: "Brooklyn Nets",
    colors:["Black", "White"],
    players: [
      { player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1,
      },
      { player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7,
      },
      { player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15,
      },
      { player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5,
      },
      { player_name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1,
      }
      ]
  }, 
  away: {
    team_name: "Charlotte Hornets",
    colors:["Turquoise", "Purple"],
    players: [
      { player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2,
      },
      { player_name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10,
      },
      { player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5,
      },
      { player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0,
      },
      { player_name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12,
      }
      ]
  }
  }
  return result
end

def num_points_scored(name)
 temp = game_hash()
 i = 0
 while i<temp[:home][:players].length do
  return temp[:home][:players][i][:points] if temp[:home][:players][i][:player_name] == name
  i+=1
  end

 j = 0
 while j<temp[:away][:players].length do
  return temp[:away][:players][j][:points] if temp[:away][:players][j][:player_name] == name
  j+=1
  end
  return "Player not found"

end

def shoe_size(name)
 temp = game_hash()
 i = 0
 while i<temp[:home][:players].length do
  return temp[:home][:players][i][:shoe] if temp[:home][:players][i][:player_name] == name
  i+=1
  end

 j = 0
 while j<temp[:away][:players].length do
  return temp[:away][:players][j][:shoe] if temp[:away][:players][j][:player_name] == name
  j+=1
  end
  return "Player not found"

end

def team_colors(name)
  temp = game_hash()
  return temp[:away][:colors] if temp[:away][:team_name] == name
  return temp[:home][:colors] if temp[:home][:team_name] == name
  return "Team not found"
end

def team_names
  temp = game_hash()
  return [temp[:home][:team_name], temp[:away][:team_name]]
end

def player_numbers(name)
  temp = game_hash()
  return temp[:away][:players].map {|n| n[:number]} if temp[:away][:team_name] == name
  return temp[:home][:players].map {|n| n[:number]} if temp[:home][:team_name] == name
  return "Team not found"
end

def player_stats(name)
 temp = game_hash()
 result = {}
 i = 0
 while i<temp[:home][:players].length do
  result = temp[:home][:players][i] if temp[:home][:players][i][:player_name] == name
  i+=1
  end

 j = 0
 while j<temp[:away][:players].length do
  result = temp[:away][:players][j] if temp[:away][:players][j][:player_name] == name
  j+=1
  end
  return result.reject! {|k| k == :player_name}
end

def big_shoe_rebounds()
 temp = game_hash()
 max_shoe = 0
 rebound = 0
 i = 0
 while i<temp[:home][:players].length do
  if temp[:home][:players][i][:shoe] > max_shoe
    rebound = temp[:home][:players][i][:rebounds] 
    max_shoe = temp[:home][:players][i][:shoe]
  end
  i+=1
  end

 j = 0
 while j<temp[:away][:players].length do
  if temp[:away][:players][j][:shoe] > max_shoe 
    rebound = temp[:away][:players][j][:rebounds] 
    max_shoe = temp[:away][:players][j][:shoe]
  end
  j+=1
  end
  
  return rebound

end

def most_points_scored
 temp = game_hash()
 max_points = 0
 result = 0
 i = 0
 while i<temp[:home][:players].length do
  if temp[:home][:players][i][:points] > max_points
    result = temp[:home][:players][i][:player_name] 
    max_points = temp[:home][:players][i][:points]
  end
  i+=1
  end

 j = 0
 while j<temp[:away][:players].length do
  if temp[:away][:players][j][:points] > max_points
    result = temp[:away][:players][j][:player_name] 
    max_points = temp[:away][:players][j][:points]
  end
  j+=1
  end
  
  return result

end

def winning_team
   temp = game_hash()
   home_points = temp[:home][:players].reduce {|sum, n| sum += n[:points]}
   away_points = temp[:away][:players].sum(&:points)
   return temp[:home][:team_name] if home_points > away_points
   return temp[:away][:team_name]
 end