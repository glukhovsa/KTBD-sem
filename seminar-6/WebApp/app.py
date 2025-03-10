#Библиотека cx_Oracle для подключения к БД
import cx_Oracle
from pprint import pprint as pp
con_db_data={
  'db_user' : "SYS",
  'db_password' : "root",
  'db_host' : "localhost",
  'db_port' : 1521,
  'db_service_name' : "FREE"
}
dsn_con = cx_Oracle.makedsn(
      con_db_data['db_host'], 
      con_db_data['db_port'], 
      service_name = con_db_data['db_service_name']
  )
connection = cx_Oracle.connect(
    user = con_db_data['db_user'],
    password = con_db_data['db_password'],
    dsn = dsn_con,
    mode = cx_Oracle.SYSDBA,
    encoding = "UTF-8"
)

#Библиотека flask для создания Web приложения
from flask import Flask
from flask import render_template
from flask import request
app = Flask(__name__)

@app.route('/')
def main():
    return render_template("main.html")

@app.route('/user/<username>')
def show_user_profile(username):
  return f'User {username}'

@app.route('/submit', methods=['POST'])
def submit():
  name = request.form['name']
  return f'Hello, {name}'

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
  connection.ping()
  status['db_connection'] = True

  #вставка в таблицу
  insert_request = 'INSERT INTO TPLG_PCB_Library (PCBLib_ID, PCBLib_Name, PCBLib_Footprint_Count) VALUES (S_TPLG_PCB_Library.NEXTVAL, \''+ PCB_Lib_parameter['PCB_Lib_name'] +'\', 5)'
  cur = connection.cursor()
  cur.execute(insert_request)
  cur.execute('INSERT INTO TPLG_PCB_Library (PCBLib_ID, PCBLib_Name, PCBLib_Footprint_Count) VALUES (S_TPLG_PCB_Library.NEXTVAL, \''+ PCB_Lib_parameter['PCB_Lib_name'] +'1'+'\', 5)')

  #проверка вставки 
  select_request = 'SELECT * FROM TPLG_PCB_Library'
  cur.execute(select_request)
  result_check = cur.fetchall()
  for row in result_check:
    print(result_check)
  if result_check != None:
    status['request'] = True
  
  cur.close()
  
  return status

if __name__ == '__main__':
  app.run(debug=True)

connection.close()