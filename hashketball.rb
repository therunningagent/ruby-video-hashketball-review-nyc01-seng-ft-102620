require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(player)
  game_hash.each do |location, team_data|

team_data[:players].each do |attribute|
  
  if attribute[:player_name] == player
    return attribute[:points]
  end 
end 
end 
end

def shoe_size(player)
  game_hash.each do |location, team_data|

team_data[:players].each do |attribute|
  
  if attribute[:player_name] == player
    return attribute[:shoe]
  end 
end 
end 
end

def team(team_name)
  case team_name
  when game_hash[:home][:team_name]
    game_hash[:home]
  when game_hash[:away][:team_name]
    game_hash[:away]
  end
end 

def team_colors(team_name)
  team(team_name)[:colors]
end 

# * Build a method, `team_names`, that operates on the game `Hash` to return an
#   `Array` of the team names.

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end 

# * Build a method, `player_numbers`, that takes in an argument of a team name and
#   returns an `Array` of the jersey numbers for that team.

def team_colors(team_name)
  game_hash.each do |loc, team_info|
    if team_info[:team_name] == team_name
      return team_info[:colors]
    end 
  end 
end 

def player_numbers(team_name)
  new_array = []
  game_hash.each do |loc, team_info|
   if team_info[:team_name] == team_name
    team_info[:players].each do |player_info, stat|
      new_array << player_info[:number]
    end 
   end 
  end 
  new_array
end 

def player_stats(players_name)
  new_hash = {}
  game_hash.each do |loc, team_info|
    team_info[:players].each do |player_info, stat|
      if player_info[:player_name] == players_name
       new_hash = player_info
     end 
   end 
 end 
new_hash
end 

def big_shoe_rebounds
  rebounds = 0
  largest_shoe = 0
  game_hash.each do |loc, team_info|
    team_info[:players].each do |player_info, stat|
      if player_info[:shoe] > largest_shoe
       largest_shoe = player_info[:shoe]
        rebounds = player_info[:rebounds] 
      end 
    end 
  end 
  rebounds
end 

def most_points_scored
  most_points = 0
  player = ""
  game_hash.each do |loc, team_info|
    team_info[:players].each do |player_info, stat|
      if player_info[:points] > most_points
        most_points = player_info[:points]
        player = player_info[:player_name]
      end 
    end 
  end 
  player
end 

def winning_team
  winner = ""
  sum1 = 0
  sum2 = 0
  game_hash.each do |loc, team_info|
    if team_info[:team_name] == "Brooklyn Nets"
    team_info[:players].each do |player_info, stat|
      sum1 += player_info[:points]
    
    else team_info[:team_name] == "Charlotte Hornets"
      team_info[:players].each do |player_info, stat|
      sum2 += player_info[:points]
    end 
  end
  if sum1 > sum2
    winner = "Brooklyn Nets"
  else 
    winner = "Charlotte Hornets"
  end 
  winner
end 