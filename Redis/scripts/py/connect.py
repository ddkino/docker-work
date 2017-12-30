import redis

# r = redis.StrictRedis(host='localhost', port=6379, password='foobared', db=0)
r = redis.StrictRedis(host='localhost', port=6379, db=0)
r.set('dd', 'dede')
print r.get('dd')