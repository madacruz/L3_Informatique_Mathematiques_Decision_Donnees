import rdflib
from rdflib import RDFS, RDF, BNode


#Définition des règles
def R1(x, p, C, saturated_file, schema_file):
    if(p != RDF.type):
        return
    superclasses = schema_file.objects(subject = C, predicate = RDFS.subClassOf)
    for C2 in superclasses :
        if (x, RDF.type, C2) not in saturated_file and not isinstance(x, BNode) :
            saturated_file.add((x, RDF.type, C2))

    
def R2(x, p, y, saturated_file, schema_file):
    superproperties = schema_file.objects(subject = p, predicate = RDFS.subPropertyOf)
    for p2 in superproperties :
        if (x, p2, y) not in saturated_file and not isinstance(x, BNode) :
            saturated_file.add((x, p2, y))


def R3(x, p, C, saturated_file, schema_file):
    if (p != RDF.type):
        return
    superclasses = schema_file.objects(subject = C, predicate = RDFS.subClassOf)
    for C2 in superclasses :
        supersuperclasses = schema_file.objects(subject = C2, predicate = RDFS.subClassOf)
        for C3 in supersuperclasses :
            if (C, RDFS.subClassOf, C3) not in schema_file :
                schema_file.add((C, RDFS.subClassOf, C3))


def R4(x, p, y, saturated_file, schema_file):
    superproperties = schema_file.objects(subject = p, predicate = RDFS.subPropertyOf)
    for p2 in superproperties :
        supersuperproperties = schema_file.objects(subject = p2, predicate = RDFS.subPropertyOf)
        for p3 in supersuperproperties :
            if (p, RDFS.subPropertyOf, p3) not in schema_file :
                schema_file.add((p, RDFS.subPropertyOf, p3))

    
def R5(x, p, y, saturated_file, schema_file):
    domain = schema_file.objects(subject = p, predicate = RDFS.domain)
    for C in domain :
        if (x, RDF.type, C) not in saturated_file and not isinstance(x, BNode) :
            saturated_file.add((x, RDF.type, C))


def R6(x, p, y, saturated_file, schema_file) :
    codomain = schema_file.objects(subject = p, predicate = RDFS.range)
    for C in codomain :
        if (y, RDF.type, C) not in saturated_file and not isinstance(y, BNode):
            saturated_file.add((y, RDF.type, C))






#main
def saturation(instance_path, schema_path, newfile_path) :
    schema = rdflib.Graph()
    schema.load(schema_path, format = "turtle")
    base_instance = rdflib.Graph()
    base_instance.load(instance_path, format="turtle")
    saturated_instance = rdflib.Graph()
    
    
    
    while (len(base_instance) != len(saturated_instance)) :

        for triple in base_instance :
            if triple not in saturated_instance :
                saturated_instance.add(triple)
        
        for (a, b, c) in base_instance :
            R1(a, b, c, base_instance, schema)
            R2(a, b, c, base_instance, schema)
            R3(a, b, c, base_instance, schema)
            R4(a, b, c, base_instance, schema)
            R5(a, b, c, base_instance, schema)
            R6(a, b, c, base_instance, schema)
        
        
    with open(newfile_path, "w") as file:
        file.write(saturated_instance.serialize(format="ttl").decode("utf-8"))

 
graph = rdflib.Graph()      
graph.parse("1_rdfSchema.rdfs")
with open("3_rdfSchema.ttl", "w") as file:
    file.write(graph.serialize(format="ttl").decode("utf-8"))
    
saturation("3_rdfTurtle.ttl", "3_rdfSchema.ttl", "4_rdfSaturated.ttl")

        
        
        
