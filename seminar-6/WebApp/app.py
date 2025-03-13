###########################################
######### Подключение библиотек ###########
###########################################

#Библиотека cx_Oracle для подключения к БД
import cx_Oracle
from pprint import pprint as pp
con_db_data={
  'db_user' : "GLUHX",
  'db_password' : "gluhx",
  'db_host' : "localhost",
  'db_port' : 1521,
  'db_service_name' : "FREE"
}
con_db_data_sys={
  'db_user' : "SYS",
  'db_password' : "root",
  'db_host' : "localhost",
  'db_port' : 1521,
  'db_service_name' : "FREE"
}

#Библиотека flask для создания Web приложения
from flask import Flask
from flask import render_template
from flask import request
from flask import redirect
from flask import make_response
from flask import send_file
from flask_qrcode import QRcode
app = Flask(__name__)
QRcode(app)

#библиотека для шифрования данных
import hashlib

#библиотека для работы с файлами
from fpdf import FPDF
import xlsxwriter

#для штрихкодов
import barcode
from barcode import EAN13
from barcode.writer import ImageWriter

###########################################
############ Функции для кода #############
###########################################

#подключение к БД
def connect_to_db():
  # connection to database
  dsn_con = cx_Oracle.makedsn(
      con_db_data['db_host'], 
      con_db_data['db_port'], 
      service_name = con_db_data['db_service_name']
  )
  connection = cx_Oracle.connect(
      user = con_db_data['db_user'],
      password = con_db_data['db_password'],
      dsn = dsn_con,
      encoding = "UTF-8"
  )
  return connection

#подключение к БЛ как SYSDBA
def connect_to_db_sys():
  # connection to database
  dsn_con = cx_Oracle.makedsn(
      con_db_data_sys['db_host'], 
      con_db_data_sys['db_port'], 
      service_name = con_db_data_sys['db_service_name']
  )
  connection = cx_Oracle.connect(
      user = con_db_data_sys['db_user'],
      password = con_db_data_sys['db_password'],
      dsn = dsn_con,
      mode=cx_Oracle.SYSDBA,
      encoding = "UTF-8"
  )
  return connection

#расчёт границ таблицы
def table_boundaries(array):
  mas =[]
  for j in array:
    for i in range(len(j)):
      if j == array[0]:
        mas.append(len(str(j[i])))
      elif len(str(j[i])) > mas[i]:
        mas[i] = len(str(j[i]))
  
  return mas

###########################################
############# Страницы сайта ##############
###########################################
@app.route('/')
def main():
    return render_template("main.html")



#ввод данных в бд
@app.route('/1.2-input')
def input_data():
  return render_template("1.2-input.html")

@app.route('/1.2-ok', methods=['POST'])
def input_data_do():
  PCB_Lib_parameter = {'PCB_Lib_name': '', 'PCB_Foot_count': 0, 'YGO_Lib_name': ''}
  
  PCB_Lib_parameter['PCB_Lib_name'] = request.form['PCB_Lib_name']
  PCB_Lib_parameter['PCB_Foot_count'] = int(request.form['PCB_Foot_count'])
  PCB_Lib_parameter['YGO_Lib_name'] = request.form['YGO_Lib_name']

  status = {'db_connection': False, 'request': False}
  # connection to database
  dsn_con = cx_Oracle.makedsn(
      con_db_data['db_host'], 
      con_db_data['db_port'], 
      service_name = con_db_data['db_service_name']
  )
  connection = cx_Oracle.connect(
      user = con_db_data['db_user'],
      password = con_db_data['db_password'],
      dsn = dsn_con,
      encoding = "UTF-8"
  )
  connection.ping()
  status['db_connection'] = True

  #вставка в таблицу
  insert_request = 'INSERT INTO TPLG_PCB_Library (PCBLib_ID, PCBLib_Name, PCBLib_Footprint_Count, PCBLib_YGOLib_Name) VALUES (S_TPLG_PCB_Library.NEXTVAL, \''+ PCB_Lib_parameter['PCB_Lib_name'] +'\', '+ str(PCB_Lib_parameter['PCB_Foot_count']) +', \''+ PCB_Lib_parameter['YGO_Lib_name'] +'\')'

  cur = connection.cursor()
  cur.execute(insert_request)
  connection.commit() 
  
  #проверка вставки 
  select_request = 'SELECT * FROM TPLG_PCB_Library WHERE PCBLib_Name = \'' + PCB_Lib_parameter['PCB_Lib_name'] +'\''
  cur.execute(select_request)
  result_check = cur.fetchall()
  if result_check != None:
    status['request'] = True
  
  cur.close()
  connection.close()
  if status['request'] and status['db_connection']:
    return render_template("1.2-ok.html")
  else:
    return "<h1>ERROR</h1>"



#ввод засекреченных данных
@app.route('/1.3-auth')
def authorization():
  if not request.cookies.get('auth_status_data'):
    status = {'data' : False, 'login' : False}
  else:
    status = {'data' : eval(request.cookies.get('auth_status_data')),
              'login' : eval(request.cookies.get('auth_status_login'))}
  print(status)

  return render_template("1.3-auth.html", status=status)

@app.route('/1.3-auth-check', methods=['POST'])
def authorization_check():
  status = {'data' : True, 'login' : False}
  user = {'login' : request.form['user_login'], 'password' : request.form['user_password']}

  check_login = 'SELECT passw FROM users_data_my WHERE login = \''+ user['login']+'\''

  cur = connection.cursor()
  result = cur.execute(check_login)
  select_password = cur.fetchall()
  select_password = [m[0] for m in select_password]
  user['password'] = hashlib.md5(user['password'].encode())
  user['password'] = user['password'].hexdigest()
  if user['password'] in select_password[0]:
    status['login'] = True

  
  cur.close()
  cook = make_response(redirect('/1.3-auth'))
  cook.set_cookie('auth_status_data', str(status['data']))
  cook.set_cookie('auth_status_login', str(status['login']))
  return cook


#ввод данных из файла
@app.route('/1.4-file')
def input_file():
  return render_template("1.4-file.html")

@app.route('/1.4-file-insert', methods=['POST'])
def insert_from_file():
  connection = connect_to_db()
  file = request.files['file-data']
  file = file.readlines()
  for line in file:
    line1=str(line)
    line_array = line1.split(",")
    line_array[4]=line_array[4].rstrip('\n')
    insert = 'INSERT INTO TPLG_Footprint (Footprint_PCBLib_ID, Footprint_ID, Footprint_Name, Footprint_Length, \
      Footprint_Width, Footprint_Instalation, Footprint_Pad_Count) VALUES((SELECT PCBLib_ID FROM TPLG_PCB_Library WHERE PCBLib_Name = \'MyLib\' \
        ), S_TPLG_Footprint.NEXTVAL,\''+line_array[0][2:] + '\','+line_array[1] + ','+line_array[2] + ',\''+line_array[3] + '\','+line_array[4]
    if insert[len(insert) - 2] == "n":
      insert = insert[:-3]+')'
    else:
      insert = insert[:-1]+')'
    cur = connection.cursor()
    print(insert)
    cur.execute(insert)
  connection.commit() 
  connection.close()
  return render_template("1.4-file-insert.html")


#ввод данных по штрихкоду
@app.route('/1.5-barcode')
def barcode():
  return render_template("1.5-barcode.html")

@app.route('/1.5-barcode-redirect', methods=['POST'])
def barcode_redirect():
  return redirect(f'/1.5-barcode-read/{request.form['barcode']}')

@app.route('/1.5-barcode-read/<barcode>')
def read_barcode(barcode):
  connection = connect_to_db()
  cur = connection.cursor()
  select = 'SELECT * FROM TPLG_Footprint WHERE Footprint_Barcode = \'' + barcode +'\''
  print(select)
  cur.execute(select)
  result = cur.fetchall()
  cur.close()
  connection.close()
  return result


#вывод данных
@app.route('/2.2-output')
def output():
  connection = connect_to_db_sys()
  cur = connection.cursor()
  select_request = 'SELECT \
	e1.last_name, \
    e1.salary, \
    e2.last_name, \
    e2.salary, \
    e1.department_id as department_id, \
    avg_salary.avg_salary as avg_salary \
FROM \
	employees e1 \
INNER JOIN employees e2 ON \
	e1.department_id = e2.department_id \
INNER JOIN ( \
	SELECT \
		AVG(salary) AS avg_salary, \
		department_id \
	FROM \
		employees \
	GROUP BY \
		department_id \
) avg_salary ON \
	avg_salary.department_id = e1.department_id \
WHERE \
	e1.salary > avg_salary.avg_salary \
	AND e2.salary > e1.salary'
  print(select_request) 
  cur.execute(select_request) 
  result = cur.fetchall() 
  cur.close()
  connection.close()
  return render_template("/2.2-output.html", result = result, header=["Фамилия", "Оклад", "Фамилия", "Оклад", "Департамент", "Ср. зарплата"])


#вывод данных в файл
@app.route("/2.4-out-in-file")
def out_into_file():
  return render_template("2.4-out-file.html")

@app.route("/2.4-out-in-file-send", methods=['POST'])
def out_into_file_send():
  connection = connect_to_db_sys()
  cur = connection.cursor()
  
  select = 'SELECT salary "Salary" \
    FROM (SELECT salary, MAX(hire_date) hire_date \
      FROM (SELECT hire_date, salary \
        FROM (SELECT hire_date, salary \
          FROM employees \
          ORDER BY hire_date DESC, salary DESC) \
          WHERE rownum <= 50) \
        GROUP BY salary \
        ORDER BY 2 DESC) \
    WHERE rownum<20'
  cur.execute(select)
  result = cur.fetchall()

  count_symbols = table_boundaries(result)
  
  if request.form['file'] == 'pdf':
    pdf = FPDF()
    pdf.add_page()
    pdf.set_font("Arial", size=12)
    for line in result:
      pdf_line = ''

      for i in range(len(line)):
        pdf_line += str(line[i]) + ' '*(count_symbols[i] - len(str(line[i])) + 3)
      pdf.cell(len(pdf_line), 10, txt=pdf_line, ln=1, align="C")
    
    response = make_response(pdf.output(dest='S').encode('latin-1'))
    response.headers.set('Content-Disposition', 'attachment', filename='PDF' + '.pdf')
    response.headers.set('Content-Type', 'application/pdf')
    return response
  elif request.form['file'] == 'xls':
    workbook = xlsxwriter.Workbook('output.xlsx')
    worksheet = workbook.add_worksheet()
    j=0
    for line in result:
      i = 0
      for word in line:
        position = f'{chr(ord('A')+i)}{j+1}'
        print(position)
        worksheet.write(position, word)
        i += 1
      j += 1
    workbook.close()
    return send_file('output.xlsx', as_attachment=True)
  else:
    return "1"

#вывод штрихкодов
@app.route("/2.5-qr")
def qr():
  connection = connect_to_db_sys()
  cur = connection.cursor()
  
  select = 'SELECT salary "Salary" \
    FROM (SELECT salary, MAX(hire_date) hire_date \
      FROM (SELECT hire_date, salary \
        FROM (SELECT hire_date, salary \
          FROM employees \
          ORDER BY hire_date DESC, salary DESC) \
          WHERE rownum <= 50) \
        GROUP BY salary \
        ORDER BY 2 DESC) \
    WHERE rownum<20'
  cur.execute(select)
  result = cur.fetchall()
  array = [str(i)[1:-2] for i in result]
  cur.close()
  connection.close()
  
  return render_template("2.5-qr.html", array = array)

if __name__ == '__main__':
  app.run(debug=True)