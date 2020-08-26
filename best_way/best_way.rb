require 'byebug'

class BestWay

  def initialize(first_position, last_position)
    @first_position = first_position
    @last_position = last_position
    @itinerary = 0
    @already_visited = 0
    @edges_distances =
    [
      [0, 5, 0, 9, 0],
      [5, 0, 6, 0, 3],
      [0, 6, 0, 8, 0],
      [9, 0, 8, 0, 4],
      [0, 3, 0, 4, 0]
    ]
  end

  def shortest_way
    byebug
    best_way = @different_itineraries.min
    puts "Shortest way is #{best_way}"
  end

  # gère les cas ou l'itinéraire est finit
  def next_itinerary
      byebug
    if @next_summit == @last_position
      @different_itineraries = []
      @different_itineraries << @itinerary
      if @next_summit.first.count == 3
        byebug
        shortest_way
      end
      search_first_edges
    end
    search_next_related_summits
  end

  # initialise l'algo à son point de départ
  def search_first_edges
    @itinerary = 0 if @itinerary != 0
    @itinerary += @first_position.select{ |num| num > 0 }.min
    search_next_related_summits
  end

  def update_itinerary
    @itinerary += @next_summit.first.select{ |num| num > 0 }.min
    delete_edge_already_made
  end

  # trouve le points points et vérifie qu'il n'est pas déjà passer
  def search_next_related_summits
    @already_visited += 1
    if @already_visited == 1
      selected_first_edges
    else
      selected_next_edges
    end
    @next_summit
    update_itinerary
  end
  # fonction pouur trouver le second points
  def selected_first_edges
    @next_summit = @edges_distances.select{ |edges| edges.include?(@first_position.select{ |distance| distance > 0}.min)if edges != @first_position }
  end

  # fonction pour trouver chaque autre points
  def selected_next_edges
    @next_summit = @edges_distances.select{ |edges| edges.include?(@next_summit.first.select{ |distance| distance > 0}.min)if edges != @next_summit && edges != @first_position  }
  end

  # fonction qui assure que chaque itinéraire est différent
  def delete_edge_already_made
    @edges_distances.each{ |edges| edges.delete(@next_summit.first.select{ |num| num > 0 }.min) }
    next_itinerary
  end

  # ne prend pas le chiffre que tu a pris précédement
  # suprime le chiffre que tu viens de prendre sauf si c'est le 1er
end
