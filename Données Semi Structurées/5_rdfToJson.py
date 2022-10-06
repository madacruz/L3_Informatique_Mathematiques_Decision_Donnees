import rdflib

graph = rdflib.Graph().parse("3_rdfTurtle.ttl", format=rdflib.util.guess_format("rdfTurtle.ttl"))
#graph = rdflib.Graph().parse("exemple.ttl", format=rdflib.util.guess_format("exemple.ttl"))

#print(graph.serialize(format="json-ld", indent=2))


with open("5_converted.jsonld", "w") as file:
    file.write(graph.serialize(format="json-ld", indent=2).decode("utf-8"))
