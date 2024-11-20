import mysql.connector
import pymongo
import time

# Параметри підключення до MySQL
mysql_config = {
    'user': 'root',
    'password': 'your_password',
    'host': 'localhost',
    'database': 'Instagram_DB'
}

# Параметри підключення до MongoDB
mongo_config = {
    'host': 'localhost',
    'port': 27017,
    'db': 'Instagram_DB',
}

# Функція для підключення до MySQL
def mysql_connect():
    conn = mysql.connector.connect(**mysql_config)
    return conn

# Функція для підключення до MongoDB
def mongo_connect():
    client = pymongo.MongoClient(mongo_config['host'], mongo_config['port'])
    db = client[mongo_config['db']]
    return db

# Функція для виконання SQL-запиту та вимірювання часу
def run_mysql_query(query):
    conn = mysql_connect()
    cursor = conn.cursor()
    start_time = time.time()
    cursor.execute(query)
    result = cursor.fetchall()
    end_time = time.time()
    cursor.close()
    conn.close()
    return round(end_time - start_time, 6)

# Функція для виконання MongoDB-запиту та вимірювання часу
def run_mongo_query(collection_name, query):
    db = mongo_connect()
    collection = db[collection_name]
    start_time = time.time()
    result = list(collection.find(query))
    end_time = time.time()
    return round(end_time - start_time, 6)

# Функція для вставки даних у MySQL
def insert_mysql_data(post_id, user_id, content):
    conn = mysql_connect()
    cursor = conn.cursor()

    query = """
    INSERT INTO comments (post_id, user_id, content)
    VALUES (%s, %s, %s)
    """
    cursor.execute(query, (post_id, user_id, content))

    conn.commit()
    cursor.close()
    conn.close()

# Функція для вставки даних у MongoDB
def insert_mongo_data(post_id, user_id, content):
    db = mongo_connect()
    posts_collection = db['posts']
    comments_collection = db['comments']

    post = posts_collection.find_one({"_id": post_id})
    if post is None:
        return

    data = {"post_id": post_id, "user_id": user_id, "content": content}
    comments_collection.insert_one(data)

# Функція для оновлення даних у MySQL
def update_mysql_data(comment_id, new_content):
    conn = mysql_connect()
    cursor = conn.cursor()
    query = "UPDATE comments SET content = %s WHERE id = %s"
    cursor.execute(query, (new_content, comment_id))
    conn.commit()
    cursor.close()
    conn.close()

# Функція для оновлення даних у MongoDB
def update_mongo_data(comment_id, new_content):
    db = mongo_connect()
    collection = db['comments']
    query = {"_id": comment_id}
    new_data = {"$set": {"content": new_content}}
    collection.update_one(query, new_data)

# Функція для видалення даних у MySQL
def delete_mysql_data(comment_id):
    conn = mysql_connect()
    cursor = conn.cursor()
    query = "DELETE FROM comments WHERE id = %s"
    cursor.execute(query, (comment_id,))
    conn.commit()
    cursor.close()
    conn.close()

# Функція для видалення даних у MongoDB
def delete_mongo_data(comment_id):
    db = mongo_connect()
    collection = db['comments']
    query = {"_id": comment_id}
    collection.delete_one(query)

# Приклад запитів для MySQL
mysql_queries = [
    "SELECT * FROM comments WHERE post_id = '1c52e058-97d9-11ef-aa44-6fb230d7a8c2'",
    "SELECT * FROM comments WHERE user_id = 'c35014f8-97d8-11ef-aa44-6fb230d7a8c2'",
    "SELECT * FROM comments WHERE content LIKE '%great%'",
    "SELECT COUNT(*) FROM comments WHERE post_id = '1c52e058-97d9-11ef-aa44-6fb230d7a8c2'"
]

# Приклад запитів для MongoDB
mongo_queries = [
    {"post_id": '1c52e058-97d9-11ef-aa44-6fb230d7a8c2'},
    {"user_id": 'c35014f8-97d8-11ef-aa44-6fb230d7a8c2'},
    {"content": {"$regex": "great", "$options": "i"}},
    {"post_id": '1c52e058-97d9-11ef-aa44-6fb230d7a8c2'}
]

# Порівняння часу виконання запитів на MySQL та MongoDB
print("Running MySQL queries...")
mysql_times = []
for query in mysql_queries:
    mysql_time = run_mysql_query(query)
    mysql_times.append(mysql_time)
    print(f"MySQL query execution time: {mysql_time} seconds")

print("\nRunning MongoDB queries...")
mongo_times = []
for query in mongo_queries:
    mongo_time = run_mongo_query('comments', query)
    mongo_times.append(mongo_time)
    print(f"MongoDB query execution time: {mongo_time} seconds")

# Вставка даних в MySQL та MongoDB
print("\nInserting data into MySQL and MongoDB...")
start_time = time.time()
insert_mysql_data("1c52e058-97d9-11ef-aa44-6fb230d7a8c2", "c35014f8-97d8-11ef-aa44-6fb230d7a8c2", "This is a test comment for MySQL.")
end_time = time.time()
print(f"MySQL insert execution time: {round(end_time - start_time, 6)} seconds")

start_time = time.time()
insert_mongo_data('1c52e058-97d9-11ef-aa44-6fb230d7a8c2', 'c35014f8-97d8-11ef-aa44-6fb230d7a8c2', 'This is a test comment for MongoDB.')
end_time = time.time()
print(f"MongoDB insert execution time: {round(end_time - start_time, 6)} seconds")

# Оновлення даних у MySQL та MongoDB
print("\nUpdating data in MySQL and MongoDB...")
start_time = time.time()
update_mysql_data("9cee18b8-a729-11ef-8dd9-6b492bfa660f", "Updated content for MySQL comment.")
end_time = time.time()
print(f"MySQL update execution time: {round(end_time - start_time, 6)} seconds")

start_time = time.time()
update_mongo_data(1, "Updated content for MongoDB comment.")
end_time = time.time()
print(f"MongoDB update execution time: {round(end_time - start_time, 6)} seconds")

# Видалення даних у MySQL та MongoDB
print("\nDeleting data in MySQL and MongoDB...")
start_time = time.time()
delete_mysql_data("9cee18b8-a729-11ef-8dd9-6b492bfa660f")
end_time = time.time()
print(f"MySQL delete execution time: {round(end_time - start_time, 6)} seconds")

start_time = time.time()
delete_mongo_data(1)
end_time = time.time()
print(f"MongoDB delete execution time: {round(end_time - start_time, 6)} seconds")
