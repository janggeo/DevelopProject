import json
import geopy

#주소 데이터 다듬기 (~건물 1층,2층 등 필요없는 데이터 제거)
with open('R_jeju_kangwon.json','r',encoding='utf-8')as fp:
    json_data = json.load(fp)
    
for i in range(len(json_data)):
    add = json_data[i]['address'].split(' ')
    json_data[i]['address'] = " ".join(add[0:4])
    
with open('jeju_kangwon2.json','w',encoding='utf-8') as f:
    json.dump(json_data,f,ensure_ascii=False, indent='\t')

    
