
import cx_Oracle


def add_entry(roll_no,name,marks):
    try:
        roll_no,marks = int(roll_no),int(marks)
    except EXCEPTION as e:
        print(e)

    sql_query = 'INSERT INTO assignment_7 VALUES (:r,:n,:m)'
    try:
        dsn_tns = cx_Oracle.makedsn('aryan-virtual-machine', '1521', service_name='XE') 
        conn = cx_Oracle.connect(user=r'aryan_user', password='1520', dsn=dsn_tns) 
        c = conn.cursor()
        c.execute(sql_query,[int(roll_no),name,int(marks)])
        conn.commit()
    except cx_Oracle.Error as e:
        print(e)

    c.execute('SELECT * FROM assignment_7')
    for rows in c:
        print(rows[0],'-',rows[1],'-',rows[2],'\n')
    conn.commit()
    c.close()

def delete_entry(sql,del_query):
    try:
        dsn_tns = cx_Oracle.makedsn('aryan-virtual-machine', '1521', service_name='XE') 
        conn = cx_Oracle.connect(user=r'aryan_user', password='1520', dsn=dsn_tns)
        c = conn.cursor()
        c.execute(sql,[del_query])
        conn.commit()

    except Exception as e:
        print(e)
    c.execute('SELECT * FROM assignment_7')
    for data in c:
        print(data[0],'-',data[1],'-',data[2],'\n')
    c.close()

def update_entry(roll_no,name,marks):
    print('here')
    try:
        roll_no,marks = int(roll_no),int(marks)
    except EXCEPTION as e:
        error_1 = e
        return error_1

    sql_query = 'UPDATE assignment_7 SET student_name = :n , marks = :m WHERE roll_no = :r'
    try:
        print('trying')
        dsn_tns = cx_Oracle.makedsn('aryan-virtual-machine', '1521', service_name='XE') 
        conn = cx_Oracle.connect(user=r'aryan_user', password='1520', dsn=dsn_tns) 
        c = conn.cursor()
        c.execute(sql_query,[name,marks,roll_no])
        conn.commit()
    except cx_Oracle.Error as e:
        error_1 = e
        return error_1

    c.execute('SELECT * FROM assignment_7')
    for rows in c:
        print(rows[0],'-',rows[1],'-',rows[2],'\n')
    conn.commit()
    c.close()


while True:
    inp = input("1.ADD\n2.DELETE\n3.UPDATE\nENTER INPUT : ")
    print('')
    match inp:
        case '1':
            roll_no,name,marks = map(str,input("ENTER ROLL NO NAME AND MARKS SEPERATED BY SPACE : ").split())
            add_entry(roll_no,name,marks)
            break
        case '2':
            sql = 'DELETE FROM assignment_7 WHERE roll_no = :r'
            del_query = int(input("Enter Roll NO to delete : "))
            delete_entry(sql,del_query)
            break
        case '3':
            roll_no,name,marks = map(str,input("ENTER ROLL NO NAME AND MARKS SEPERATED BY SPACE : ").split())
            update_entry(roll_no,name,marks)
