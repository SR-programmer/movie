from selenium import webdriver

import pymysql

path = 'movie'

def get_home_url(request_url):
    browser.get(request_url)

    browser.implicitly_wait(10)


def get_movie_list():
    movie_list = browser.find_elements_by_class_name('item-thumbnail ')  # 获取所有的页面
    yield movie_list


def get_movie_info(movie_list):
    for movie in movie_list:
        movie_url = movie.find_element_by_tag_name('a').get_attribute('href')
        movie_title = movie.find_element_by_tag_name('a').get_attribute('title')

        img_url = movie.find_element_by_tag_name('img').get_attribute('src')

        img_title = movie.find_element_by_tag_name('img').get_attribute('title')

        img_alt = movie.find_element_by_tag_name('img').get_attribute('alt')
        yield movie_url,movie_title,img_url,img_title,img_alt



def down_load( movie_url, movie_title, img_url, img_title, img_alt):

    db = pymysql.connect(host="localhost", user="root",
                         password="123", db="movie", port=3306)

    cur = db.cursor()

    sql_insert = """insert into movies(movie_url, movie_title, img_url, img_title, img_alt) values({},{},{},{},{})""".format(
        repr(movie_url), repr(movie_title), repr(img_url), repr(img_title), repr(img_alt))

    try:
        cur.execute(sql_insert)

        # 提交
        db.commit()

    except Exception as e:
        # 错误回滚
        print(e)
        db.rollback()
    finally:

        db.close()


def main():
    request_url = 'https://www.novipnoad.com/'
    get_home_url(request_url)
    movie_list = list(get_movie_list())[0]
    movie_info_list = list(get_movie_info(movie_list))
    for movie_info in movie_info_list:
        movie_url, movie_title, img_url, img_title, img_alt = movie_info
        down_load( movie_url, movie_title, img_url, img_title, img_alt)




if __name__ == '__main__':
    browser = webdriver.Chrome()
    try:
        main()
    except Exception as e:
        print(e)
    finally:
        browser.close()