import rdflib

graph = rdflib.Graph()
graph.parse("2_rdfXml.rdf")

with open("3_rdfTurtle.ttl", "w") as file:
    file.write(graph.serialize(format="ttl").decode("utf-8"))
