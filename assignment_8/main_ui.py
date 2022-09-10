import time
from tkinter import *
import backend as b

root = Tk()
root.title('Assignment 7')
root.geometry('600x400')

page_var = 1

def back_button():
    global add_student_label,delete_student_label,update_label
    if page_var==1:
        pass
    elif page_var==2:
        add_student_label.place_forget()
        add_frame.forget()
        back_butt.place_forget()
        frame.pack()
        root.update()
    elif page_var== 3:
        delete_student_label.place_forget()
        delete_frame.forget()
        back_butt.place_forget()
        frame.pack()
        root.update()
    elif page_var==4:
        update_label.place_forget()
        update_frame.forget()
        back_butt.place_forget()
        frame.pack()
        root.update()
    elif page_var==5:
        show_frame.forget()
        back_butt.place_forget()
        frame.pack()

def submit_button():
    submit['state'] = DISABLED
    roll_no = roll_number_entry.get()
    name = name_entry.get()
    marks = marks_entry.get()
    roll_number_entry.delete(0,'end')
    marks_entry.delete(0,'end')
    name_entry.delete(0,'end')
    text_mess = 'roll no: '+roll_no+'        name: '+name+'          marks: '+marks
    error = b.add_entry(roll_no,name,marks)
    print(error)
    if error == '':
        message = Label(add_frame,text = text_mess)
        message.pack(side=BOTTOM)
    else:
        print('erere')
        message = Label(add_frame,text=error)
        message.pack(side=BOTTOM)
        message.place(x=10,y=80)

    root.update()
    time.sleep(2)
    message.destroy()
    submit['state'] = NORMAL
    root.update()

    return

def add_student():
    global page_var,add_student_label
    page_var = 2
    back_butt.pack()
    back_butt.place(x = 2,y= 10)
    add_student_label = Label(root,text = 'ADD STUDENT')
    frame.forget()
    add_student_label.pack()
    add_student_label.place(x = 250,y = 50)
    add_frame.pack()
    root.update()



    return

def delete_student_command():
    del_query = int(delete_query_entry.get())
    delete_query_entry.delete(0,'end')
    sql = 'DELETE FROM assignment_7 WHERE roll_no = :r'
    error_2 = b.delete_entry(sql,del_query)

def delete_student():
    global page_var,delete_student_label
    page_var = 3
    back_butt.pack()
    back_butt.place(x = 2,y= 10)
    delete_student_label = Label(root,text = 'DELETE STUDENT\nENTER ROLL NO.:')
    delete_student_label.pack()
    delete_student_label.place(x = 240,y = 50)
    frame.forget()
    delete_frame.pack()
    root.update()
    return

def update_page():
    global page_var
    page_var = 4
    back_butt.pack()
    back_butt.place(x = 2,y= 10)
    frame.forget()
    update_label.pack(side=TOP)
    update_label.place(x = 270,y=20)
    update_frame.pack()

    root.update()

def update_button_command():
    roll_no = up_roll_no_entry.get()
    name = up_name_entry.get()
    marks = up_marks_entry.get()
    e = b.update_entry(roll_no,name,marks)
    print(e)

def show_data_command(root,show_frame):
    global page_var
    page_var = 5
    frame.forget()
    show_frame.pack()
    back_butt.pack()
    back_butt.place(x = 2,y= 10)
    a = b.show_entries(root,show_frame)
    return


back_butt = Button(root,text = '<-',command=back_button)




frame = Frame(root,padx=10,pady=150)
welcome_mess =Label(frame,text = "Welcome!",font=("Arial", 25))
welcome_mess.pack(side=TOP)
#welcome_mess.place(x=10,y=0)
add = Button(frame,text = 'Add Student',command=add_student)
delete_stu = Button(frame,text='Delete Student',command=delete_student)
update = Button(frame,text = 'Update Student',command=update_page)
display = Button(frame,text = 'Display Table')
show = Button(frame,text='Show data',command=lambda:show_data_command(root,show_frame))
show.pack(side=BOTTOM)


add_frame = Frame(root,pady=180)

roll_number_entry = Entry(add_frame,width=20)
name_entry = Entry(add_frame,width=20)
marks_entry = Entry(add_frame,width=20)

roll_number_label = Label(add_frame,text='Roll No:')
name_label = Label(add_frame,text='Name:')
marks_label = Label(add_frame,text='Marks:')

roll_number_label.pack(side=TOP)
name_label.pack(side=TOP)
marks_label.pack(side=TOP)

roll_number_label.place(x = 30)
marks_label.place(x = 370)

roll_number_entry.pack(side=LEFT)
name_entry.pack(side=LEFT)
marks_entry.pack(side=LEFT)

roll_number_entry.insert(0,'12')
name_entry.insert(0,'Aryan')
marks_entry.insert(0,'11')

submit = Button(add_frame,text="Submit",command=submit_button)
submit.pack(side=BOTTOM)
submit.place(x=190,y=50)

frame.pack()
add.pack(side=LEFT)
delete_stu.pack(side=LEFT)
update.pack(side=LEFT)

delete_frame = Frame(root,pady=100)
delete_query_entry = Entry(delete_frame,width= 20)
delete_query_entry.pack()
delete_button = Button(delete_frame,text= "delete student entry",command=delete_student_command)
delete_button.pack()
delete_button.place(y=80)

update_frame = Frame(root,pady=100)
update_label = Label(root,text = 'UPDATE ')

up_roll_no_entry = Entry(update_frame,width=20)
up_name_entry = Entry(update_frame,width=20)
up_marks_entry = Entry(update_frame,width=20)
update_button = Button(update_frame,text = 'Update entry',command=update_button_command)

roll_number_label_1 = Label(update_frame,text='Roll No:')
name_label_1 = Label(update_frame,text='Name:')
marks_label_1 = Label(update_frame,text='Marks:')

roll_number_label_1.pack(side=TOP)
name_label_1.pack(side=TOP)
marks_label_1.pack(side=TOP)

roll_number_label_1.place(x = 30)
marks_label_1.place(x = 370)

up_roll_no_entry.pack(side=LEFT)
up_name_entry.pack(side=LEFT)
up_marks_entry.pack(side=LEFT)

show_frame = Frame(root)


update_button.pack(side=BOTTOM)
update_button.place(x = 200,y = 50)
root.mainloop()


