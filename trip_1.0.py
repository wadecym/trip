import requests
import json
import jsonpath
from lxml import etree
import time
import pymysql


class Trip():
    def __init__(self, host, country='', city='', beginDt='', endDt=''):
        self.host = host
        self.country = country
        self.city = city
        self.beginDt = beginDt
        self.endDt = endDt
        self.url = ''
        self.pageALL = 1
        self.maxpage = 1

        # 連接MySQL相關設定
        self.dbhost = '127.0.0.1'
        self.dbport = 3306
        self.dbuser = 'root'
        self.dbpassword = ''
        self.database = 'trip'
        self.dbcharset = 'utf8'

    def newamazing(self):
        self.url = 'https://www.newamazing.com.tw'
        # 搜尋旅遊國家/地區 :以日本-東京為例
        self.country = '0001'
        self.city = '0001-0003'
        #出發日期區間
        self.beginDt = '2019/03/31'
        self.endDt = '2019/10/01'
        # 和MySQL使用的表名對應
        self.dbtable = 'newamazing'
        # 和MySQL cocomp 表中的數值對應
        self.cocomp_id = 2

    def orangetour(self):
        self.url = 'http://www.orangetour.com.tw'
        # 搜尋旅遊國家/地區 :以日本-東京為例
        self.country = '0015'
        self.city = '0015-0003'
        # 出發日期區間
        self.beginDt = '2019/03/31'
        self.endDt = '2019/10/01'
        # 和MySQL使用的表名對應
        self.dbtable = 'orangetour'
        # 和MySQL cocomp 表中的數值對應
        self.cocomp_id = 3

    def run(self):
        if hasattr(spider, search_hostname):
            host = getattr(spider, search_hostname)
            host()
        else:
            print('未支援搜尋此網站')
            exit()

        # 連接MySQL
        self.conn = pymysql.connect(host=self.dbhost, port=self.dbport, user=self.dbuser, password=self.dbpassword,
                                    db=self.database,
                                    charset=self.dbcharset)
        self.cursor = self.conn.cursor()
        self.parse_data()

        # 切換到其他分頁查詢
        time.sleep(1)
        if int(self.maxpage[0]) >= 2:

            for page in range(2, int(self.maxpage[0]) + 1):
                print('切換到第%s頁' %page)
                self.pageALL = page
                self.parse_data(page)
                time.sleep(1)

        # 關閉MySQL連接
        self.cursor.close()
        self.conn.close()

    def parse_data(self, currpage=1):
        url = self.url + '/EW/Services/SearchListData.asp'
        page_url = self.url + '/EW/Services/SearchPageList.asp'
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36',
        }
        # 旅遊區域 新魅力旅遊 regmCd 0001:日本 0002:韓國,00015:國內旅遊,00020:美國,加拿大;regsCd 0001-0002:京阪神,0001-0003:東京(小東北),0001-0001:北海道,不填為不限 ,澄果旅遊編號有差異
        regmCd = self.country
        regsCd = self.city
        # 出發日期 ; 2019/03/31
        beginDt = self.beginDt
        # 結束日期; 2019/10/01
        endDt = self.endDt
        # 旅遊天數格式 3-5
        tdays = ""
        # 出發機場;桃園機場:TPE
        portCd = ""
        # 每人預算; 20001-40000
        bjt = ""
        # 航空公司;長榮:BR
        carr = ""

        formdata = {
            "displayType": "G",
            "subCd": "",
            "orderCd": 1,
            "pageALL": currpage,
            "pageGO": 1,
            "pagePGO": 1,
            "waitData": "false",
            "waitPage": "false",
            "mGrupCd": "",
            "SrcCls": "",
            "tabList": "",
            "regmCd": regmCd,
            "regsCd": regsCd,
            "beginDt": beginDt,
            "endDt": endDt,
            "portCd": portCd,
            "tdays": tdays,
            "bjt": bjt,
            "carr": carr,
        }

        # 第一次同時尋找此搜尋項目的最大頁數
        if self.pageALL == 1:
            pagedata = requests.post(url=page_url, headers=headers, data=formdata).content.decode('utf-8')
            tree = etree.HTML(pagedata)
            self.maxpage = tree.xpath('//input[@name="maxPageALL"]/@value')[0]

        html = requests.post(url=url, headers=headers, data=formdata).content.decode('utf-8')
        jsonobj = json.loads(html)

        # 所需資料項目
        # 旅行社名稱
        SiteTitle = jsonpath.jsonpath(jsonobj, '$.[SiteTitle]')
        # 團號
        GrupCd_list = jsonpath.jsonpath(jsonobj, '$.All.[GrupCd]')
        # 行程名稱
        title_list = jsonpath.jsonpath(jsonobj, '$.All.[GrupSnm]')
        # 天數
        days_list = jsonpath.jsonpath(jsonobj, '$.All.[GrupLn]')
        # 出發日期
        date_list = jsonpath.jsonpath(jsonobj, '$.All.[LeavDt]')
        # 可售位
        sale_list = jsonpath.jsonpath(jsonobj, '$.All.[SaleYqt]')
        # 總團位
        totalsale_list = jsonpath.jsonpath(jsonobj, '$.All.[EstmTotqt]')
        # 銷售價
        price_list = jsonpath.jsonpath(jsonobj, '$.All.[SaleAm]')
        # 出發機場
        portNm_list = jsonpath.jsonpath(jsonobj, '$.All.[PortNm]')
        # 行程網址
        url_list = jsonpath.jsonpath(jsonobj, '$.All.[Url]')
        # 行程縮圖網址
        imgurl_list = jsonpath.jsonpath(jsonobj, '$.All.[ImgUrl]')

        for i in range(0, len(title_list)):
            detal_url = self.url + url_list[i]
            imgurl = self.url + imgurl_list[i]

            print('第%s項資料 : ' % (i + 1))
            print(
                '團號: %s ;旅行社名稱: %s ;行程名稱: %s ; 天數 : %s ; 出發日期 : %s ; 可售位 : %s ; 總團位 : %s ; 銷售價 :　%s ;  出發機場 :　%s ; 網址 :　%s; 行程圖片網址 :　%s' % (
                    GrupCd_list[i], SiteTitle[0], title_list[i], days_list[i], date_list[i], sale_list[i],
                    totalsale_list[i], price_list[i], portNm_list[i], detal_url, imgurl))

            sql = "insert into {0}(grupcd,title,days,begindate,sale,totalsale,price,portnm,url,imgurl, cocomp_id) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)".format(
                self.host)

            ret = self.cursor.execute(sql, [GrupCd_list[i], title_list[i], days_list[i], date_list[i],
                                            sale_list[i], totalsale_list[i], price_list[i], portNm_list[i],
                                            detal_url, imgurl, self.cocomp_id])
            self.conn.commit()


if __name__ == '__main__':
    search_hostname = 'newamazing'
    spider = Trip(host=search_hostname)
    spider.run()
