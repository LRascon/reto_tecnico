# Conexión a enlace
import requests

def obtener_datos_desde_enlace(enlace):
    try:
        respuesta = requests.get(enlace)
        respuesta.raise_for_status()  # Verificar si la solicitud fue exitosa
        datos = respuesta.json()  # Convertir la respuesta a formato JSON
        return datos
    except requests.exceptions.RequestException as e:
        print("Error al obtener datos:", e)
        return None

# Enlace proporcionado
enlace = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow"

datos = obtener_datos_desde_enlace(enlace)
if datos:
    print("Datos obtenidos correctamente.")
else:
    print("No se pudieron obtener los datos.")

# Funciones
def obtener_respuestas_contestadas_no_contestadas(datos):
    contestadas = sum(1 for respuesta in datos['items'] if respuesta.get('is_answered'))
    no_contestadas = len(datos['items']) - contestadas
    return contestadas, no_contestadas

def obtener_respuesta_menor_vistas(datos):
    respuesta_menor_vistas = min(datos['items'], key=lambda x: x.get('view_count'))
    return respuesta_menor_vistas

def obtener_respuesta_mas_antigua_y_mas_reciente(datos):
    respuestas = datos['items']
    respuesta_mas_antigua = min(respuestas, key=lambda x: x['creation_date'])
    respuesta_mas_reciente = max(respuestas, key=lambda x: x['creation_date'])
    return respuesta_mas_antigua, respuesta_mas_reciente

def obtener_owner_con_mayor_reputacion(datos):
    owner_con_mayor_reputacion = max((respuesta['owner'] for respuesta in datos['items'] if respuesta.get('owner')), key=lambda x: x['reputation'], default=None)
    return owner_con_mayor_reputacion

# Llamadas a las funciones y obtener los resultados
contestadas, no_contestadas = obtener_respuestas_contestadas_no_contestadas(datos)
print("Respuestas contestadas:", contestadas)
print("Respuestas no contestadas:", no_contestadas)

respuesta_menor_vistas = obtener_respuesta_menor_vistas(datos)
print("Respuesta con menor número de vistas:")
print("  - Título:", respuesta_menor_vistas.get('title'))
print("  - Vistas:", respuesta_menor_vistas.get('view_count'))

respuesta_mas_antigua, respuesta_mas_reciente = obtener_respuesta_mas_antigua_y_mas_reciente(datos)
print("Respuesta más antigua:")
print("  - Título:", respuesta_mas_antigua.get('title'))
print("  - Fecha de creación:", respuesta_mas_antigua.get('creation_date'))
print("Respuesta más reciente:")
print("  - Título:", respuesta_mas_reciente.get('title'))
print("  - Fecha de creación:", respuesta_mas_reciente.get('creation_date'))

owner_con_mayor_reputacion = obtener_owner_con_mayor_reputacion(datos)
if owner_con_mayor_reputacion:
    print("Owner con mayor reputación:")
    print("  - Nombre de usuario:", owner_con_mayor_reputacion.get('display_name'))
    print("  - Reputación:", owner_con_mayor_reputacion.get('reputation'))
else:
    print("No hay información sobre el owner con mayor reputación.")
