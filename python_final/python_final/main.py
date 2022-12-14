tasks = [
    {'name' : 'Write email to Jan', 'completed' : True},
    {'name' : 'Sweep front porch', 'completed' : True},
    {'name' : 'Call mom', 'completed' : False}
]

def list_tasks():
    for index, task in enumerate(tasks):
        print(str.format('{}: {} (Completed: {})', index, task['name'], task['completed']))


def add_task():
    task_text = input('Please add a task: ')
    new_task ={'name':task_text,'completed':False}
    # Using the above task_text variable, create a dictionary named new_task and set completed to False
    tasks.append(new_task)
    # Then, add new_task to the tasks list

def remove_task():
# You will need a function to handle removing a task.
    # When this function is run, list out the tasks. Hint! There is already a function that handles this
    list_tasks()
    # Here, create a variable that uses input. The user should be able to input the index number of the task to be removed. Hint! You will need to wrap the input() function within the int() function so the user's input is read as a number.
    remove = int(input('Which number task was accomplished? :'))
    # Here, delete the task in the tasks list based on the above variable
    tasks.remove(tasks[remove])

def mark_task():
# You will need a function to handle marking a task complete.
    # When this function is run, list out the tasks. Hint! There is a function that already does this for you.
    list_tasks()
    # Here, create a variable that uses input. The user should be able to input the index number of the task to be marked complete. Hint! You will need to wrap the input() function within the int() function so the user's input is read as a number.
    mark_complete = int(input('Which number task was accomplished? :'))
    # Mark the task complete in the tasks list based on the variable you created above. Hint! you will need to use two sets of square brackets to find the index and set the appropriate key to True 
    tasks[mark_complete]['completed'] = True
    

menu_text = """
====================
1. List the tasks
2. Add a task
3. Remove a task
4. Mark task complete
5. Quit

What would you like to do? """

program_is_running = True

while program_is_running:
    decision = input(menu_text)
    if decision == '1':
        list_tasks()
    # Add elif statements for inputs 2, 3, and 4
    elif decision == '2':
        add_task()
    elif decision == '3':
        remove_task()
    elif decision == '4':
        mark_task()
    elif decision == '5':
        program_is_running = False
    else: 
        print('please choose a valid option')


