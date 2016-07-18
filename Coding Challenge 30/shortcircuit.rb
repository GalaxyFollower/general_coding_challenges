#Example input:
#graph = [['A', 'B', 50], ['A', 'D', 150], ['B', 'C', 250], ['B', 'E', 250], ['C', 'E', 350],
#['C', 'D', 50], ['C', 'F', 100], ['D', 'F', 400], ['E', 'G', 200], ['F', 'G', 100]]
#start_node='A'
#end_node='G'

NODES = 0..1
LENGTH = 2
INFINITY = 1.0/0

class Path < Array
    def distance
        (any?)? inject(0) { | sum, edge | sum += edge[LENGTH] } : INFINITY
    end
end


def shortest_path(start_node, end_node, graph)
    adjacent_edges = graph.select{ | edge | edge[NODES].include?(start_node) }
    remaining_edges = graph - adjacent_edges
    shortest_path = Path.new
    adjacent_edges.each do | edge |
        path = Path.new [edge]
        neighbor_node = (edge[NODES] - [start_node])[0]
        unless neighbor_node == end_node
            path_ahead = shortest_path(neighbor_node, end_node, remaining_edges)
            (path_ahead.empty?)? path.clear : path.concat(path_ahead)
        end
        shortest_path = path if path.distance < shortest_path.distance
    end
    shortest_path
end