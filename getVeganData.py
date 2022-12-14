#비건 인증 제품 정보가 등록된 태그
#비건인증 브랜드/기업은 아래 태그가 없다.
# <div class="table-cell board_thumb_wrap">
# 										<a class="_fade_link" href="/production/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&amp;bmode=view&amp;idx=12692975&amp;t=board" style="padding: 0">
# 											<img src="https://cdn.imweb.me/thumbnail/20220905/05482fb69f5a6.png" class="board_thumb" style="cursor:pointer" alt="">
# 											<span class="sr-only">게시판 썸네일</span>
# 										</a>
# 									</div>
                    


import urllib.request
from bs4 import BeautifulSoup as bs
import re
import json, csv

def toJson(recipe_dict):
    with open('product.json','w',encoding='utf-8')as file :
        json.dump(recipe_dict, file, ensure_ascii=False, indent='\t')

# def toCSV(recipe_list):
#     with open('ingredients.csv', 'w', encoding='utf-8', newline='')as file:
#         csvfile=csv.writer(file)
#         for row in recipe_list:
#             csvfile.writerow(row)

def url_func(n, m):
    num_range=range(n,m)
    #비건인증 제품/브랜드 홈페이지 29page까지 존재
    url="https://vegan-korea.com/production/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&page="
    url_list=[]
    
    for num in num_range:
        req = urllib.request.Request(url+str(num))
        code=urllib.request.urlopen(req).read()
        soup=bs(code,"html.parser")
        
        try:
            res=soup.find_all(class_='board_thumb_wrap')
            
            for j in res:
                
                i=j.find('a')
                url_tmp=i.get('href')
                url_list.append(url_tmp)
                
                
        except(AttributeError):
            print("url_func pass")
            pass
    return url_list


count=0
num_id=0
product_dicts=[]
ingre_set=set()
url_lists=url_func(1,29)

for url_str in url_lists:
    try:
        
        url="https://vegan-korea.com"
        url=url+url_str
        
        req=urllib.request.Request(url)
        code=urllib.request.urlopen(url).read()
        
        soup=bs(code,"html.parser")
      
        
        product_img=[]
        product_info=[]
        #분류
        res=soup.find('span','category')
        category=res.get_text()
        #print(category)
        #회사이름
        res=soup.find('p','view_tit')
        company_name=res.get_text()
        #print(company_name)
        #이미지
        res=soup.find('div','margin-top-xxl')
        res=res.find_all('img')
        for i in res:
            product_img.append(i.get('src'))
        #print(product_img)
        #제품정보(제품명, 인증번호, 인증시작/종료)
        res=soup.find('div','margin-top-xxl')
        res=res.find('table')
        res=res.find('tr')
        
        try:
            while(True):
                product_tmp=[]
                res=res.findNext('tr')
                
                tmp=res.find_all('td')
                
                num_certi=tmp[0].get_text()
                product_name=tmp[2].get_text()
                start_certi=tmp[3].get_text()
                end_certi=tmp[4].get_text()
                
                product_tmp.append(num_certi)
                product_tmp.append(product_name)
                product_tmp.append(start_certi)
                product_tmp.append(end_certi)
                
                product_info.append(product_tmp)
                #print(product_info)
        except:
            print("다했음 or 오류")
            pass
            
        num_id =num_id+1
        product_dict={"id":num_id,
                      "category":category,
                  "name":company_name,
                  "img":product_img,
                  "product":product_info
                  }

        product_dicts.append(product_dict)
    except:
        print("pass")
        count=count+1
        pass
    
toJson(product_dicts)
print("생략 개수 : "+ str(count))