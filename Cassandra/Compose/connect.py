from cassandra.cluster import Cluster

cluster = Cluster(['127.0.0.1'], port = 29054)
cluster = Cluster(['127.0.0.1'], port = 9048)
session = cluster.connect()

print(session)