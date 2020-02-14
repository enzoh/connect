import Array "mo:stdlib/array";
import Iter "mo:stdlib/iter";
import Principal "mo:stdlib/principalId";

module {
  type Vertex = Principal;

  public class Digraph() {

    var vertexList : [Vertex] = [];
    var edgeList : [(Vertex, Vertex)] = [];

    public func addVertex(vertex : Vertex) {
      vertexList := Array.append<Vertex>(vertexList, [vertex]);
    };

    public func addEdge(fromVertex : Vertex, toVertex : Vertex) {
      edgeList := Array.append<(Vertex, Vertex)>(edgeList, [(fromVertex, toVertex)]);
    };

    public func getAdjacent(vertex : Vertex) : [Vertex] {
      var adjacencyList : [Vertex] = [];
      for ((fromVertex, toVertex) in Iter.fromArray<(Vertex, Vertex)>(edgeList)) {
        if (fromVertex == vertex) {
          adjacencyList := Array.append<Vertex>(adjacencyList, [toVertex]);
        };
      };
      adjacencyList
    };

    public func hasEdge(fromVertex : Vertex, toVertex : Vertex) : Bool {
      for ((from, to) in Iter.fromArray<(Vertex, Vertex)>(edgeList)) {
        if (from == fromVertex and to == toVertex) { return true; }
      };
      false
    };
  };
};
