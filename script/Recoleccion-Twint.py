#Bibliotecas
import snscrape.modules.twitter as sntwitter # Scraper
import itertools # Objetos de iteración
import threading # Hilos
import re # Expresiones regulares
from sentiment_analysis_spanish import sentiment_analysis # Analisis de sentimientos
import pymysql # Base de datos

# Variables globales
palabras='"vacuna" OR "vacunandome" OR "vacunado" OR "dosis" OR "covid" OR "AstraZeneca" OR "Pfizer" OR "Sputnik" '
fecha_inicio = "2020-02-15"
numTweets = 80 # Numero de tweets que se descargaran

# Funciones
def conexion_Mariadb():
    try:
        # Establecer la conexion
        conexion=pymysql.connect(
            host='localhost',
            user='cesar',
            password='password',
            database='tweets'
        )
    except mariadb.Error as e: # En cado de error en la conexion
        print("Error al conectarse a la base de datos",e)
    cursor=conexion.cursor() # Crear un cursor que se conecte a la base
    return cursor # Regresar cursor

def snscrape(latitud, longitud):
    search = '%ssince:"%s" geocode:"%s,%s,0.2km"'%(palabras,fecha_inicio,latitud,longitud)
    busqueda=sntwitter.TwitterSearchScraper(search).get_items()
    return itertools.islice(busqueda, numTweets)

def filtrarTweets(tweets):
    tweetsFiltrados=[]
    repetidos=0
    for tweet in tweets:
        db=conexion_Mariadb() # cursor que se conecta a la base de datos
        query="select * from `Tweets` where `idTwitter` = %s" # Query para consultar si el id del tweet ya se encuentra en la base de datos
        consulta = db.execute(query,(tweet.id)) # Ejecutar Query
        db.close() # Terminar la conexión del cursor
        if consulta==0: # Compruba que no haya coincidencia
            tweetsFiltrados.append(tweet) # Agregar a la coleccion
        else:
            repetidos=repetidos+1
    # print("%s Tweets ya existentes en la base de datos" %(repetidos))
    #print("%s," %(repetidos), end="")
    return tweetsFiltrados # Regresar la coleccion

def guardarTweets(tweet, inicio, fin):
    for i in range(inicio,fin): # Recorrer la lista desde el inicio y fin especificados
        db=conexion_Mariadb() # cursor que se conecta a la base de datos
        texto=limpiarTexto(tweet[i].content) # Limpiar texto del tweet
        analisis=analizar(texto) # Analisis de sentimientos
        query="insert into `Tweets` values(null,%s,%s,%s,%s,%s)" # Query para insetar la información de los tweets en la base de datos
        try:
            db.execute(query,(tweet[i].id,texto,tweet[i].date.date(),sentimiento(analisis),idModulo)) # Ejecutar el query
        except (pymysql.err.IntegrityError,pymysql.err.DataError, pymysql.err.InternalError): # En caso de error al almacenar tweet
            print("El registro que intentas almacenar ya existe")
        db.close() # Terminar la conexión del cursor

def sentimiento(analisis):
    if analisis<=0.33: # Comprobar que el analisis es menor o igual que 0.33
        return 3 # Negativo
    elif analisis>0.33 and analisis<=0.67: # Comprobar que el analisis se encuentra en el rango de 0.33 y 0.67
        return 2 # Neutro
    else: # Comprobar que el analisis es mayor a 0.67
        return 1 # Positivo

def analizar(texto):
    sentiment = sentiment_analysis.SentimentAnalysisSpanish()
    return sentiment.sentiment(texto)

def limpiarTexto(texto):
    texto = texto.replace("#",'')
    texto = re.sub(r'https?:(/*[\w.]+)+', '', texto) #Quitar los links
    #Quitar mensiones
    texto = re.sub(r'[(]\s*@\s*(\w+\W*\s*)*[)]', '', texto)
    texto = re.sub(r'@\w*\W*', '', texto)
    texto = re.sub(r'[^\w*\s*]', '', texto) #Deja solo caracteres de palabra
    return texto

if __name__ == '__main__':
    # print("Buscar ",numTweets,"Tweets para cada modulo")
    db=conexion_Mariadb() # cursor que se conecta a la base de datos
    db.execute("select idModulo,nombre,latitud,longitud from `Modulo`") # Consultar los modulos de vacunacion en la base de datos
    db.close() # Cerrar la conexion a la base de datos
    # Recolectar tweets para cada modulo
    for (idModulo,nombre,latitud,longitud) in db:
        print("Modulo %s: %s" %(idModulo, nombre))
        tweets= filtrarTweets(snscrape(latitud,longitud)) # Filtrar los tweets que aun no se almacenan
        longitud=len(tweets) # Cantidad de tweets despues de filtrarlos
        print("Guardando %s tweets \n" %(longitud))
        # print("%s" %(longitud))
        # Hilos que se encargan de guardar tweets
        t1=threading.Thread(target=guardarTweets, args=(tweets,0,int(longitud/4),))
        t2=threading.Thread(target=guardarTweets, args=(tweets,int(longitud/4),int(longitud/2),))
        t3=threading.Thread(target=guardarTweets, args=(tweets,int(longitud/2),int(3*longitud/4),))
        t4=threading.Thread(target=guardarTweets, args=(tweets,int(3*longitud/4),longitud,))
        # Iniciar hilos
        t1.start()
        t2.start()
        t3.start()
        t4.start()
        # Esperar a que terminen los hilos
        t1.join()
        t2.join()
        t3.join()
        t4.join()
