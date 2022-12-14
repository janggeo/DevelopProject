import geopy
import json
from geopy.geocoders import Nominatim
geo_local = Nominatim(user_agent='South Korea')

# 위도, 경도 반환하는 함수
def geocoding(address):
    try:
        geo = geo_local.geocode(address)
        x_y = [geo.latitude, geo.longitude]
        return x_y

    except:
        print(1)
        return [0,0]

# 주소 -> 위도, 경도 
#geopy 버전

with open('jeju_kangwon2.json','r',encoding='utf-8')as fp:
    json_data = json.load(fp)


latitude = [] #위도
longitude =[] #경도
address = []
for i in range(len(json_data)):
    address.append(json_data[i]["address"])
print(address)
for i in address:
    latitude.append(geocoding(i)[0])
    longitude.append(geocoding(i)[1])
print(latitude)


# json파일에 위도 경도 값 추가
for i in range(len(json_data)):
    json_data[i].update(
        {"coordinate":[longitude[i]
         ,latitude[i]]}
    )
with open('jeju_kangwon3.json','w',encoding='utf-8') as f:
    json.dump(json_data,f,ensure_ascii=False, indent='\t')