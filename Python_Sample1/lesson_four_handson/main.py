#Part 1
#Create two dictionaries to represent information about two pets.
Pets_Name = {
    'birdie':{
        'Type_of_Pet': 'Cat',
        'Color':'White and Orange',
        'Nickname':'Birchy',
        'Owners_name':'Kurt'
        },
    'st.paul':{
        'Type_of_Pet':"Cat",
        'Color':'Tortoise Shell',
        'Nickname':'Palnut',
        'Owners_name': 'Olivia'
        }
}
print(Pets_Name)

# Iterate over each dictionary, printing each key-value pair on one line. 
for pet in Pets_Name.values():
    print("Type: ",pet['Type_of_Pet'],
          "\nColor: ",pet['Color'],
          "\nNickname: ", pet['Nickname'],
          "\nOwer: ", pet['Owners_name']
          )

#Part 2
#Add three new dictionaries to your program.
#Each dictionary should represent a city around the world.
World_citys = { 'england' : {'Capital': 'London'},
               'france' : {'Capital': 'Paris'},
               'belgium' : {'Capital': 'Brussels'}
               }

#Given the above dictionaries, add the following information to each dictionary:
#Population
World_citys['england']['population']='53.01millon'
World_citys['france']['population']='66.9millon'
World_citys['belgium']['population']='11.35millon'

#Interesting Fact
World_citys['england']['fact']="I've visited london in 2001"
World_citys['france']['fact']='Called the city of lights'
World_citys['belgium']['fact']='Has 2,000 chocolate shops'

#Top Language Spoken by Locals
World_citys['england']['language']='English'
World_citys['france']['language']='French'
World_citys['belgium']['language']='Dutch'
print(World_citys)

for key,value in World_citys.items():
    print('Key=', key, '\n \tValue=',value)
    

#Part 3
#Add a dictionary to your program that replicates a user's pizza order. Name this dictionary pizza_order and it should contain the following:
#Customer's Name
#What size pizza they have ordered
#What type of crust
#What toppings they would like.
#Toppings should include at least three separate toppings

pizza_order={
    'name': 'Andrew',
    'Size': 'small',
    'Crust': 'thin-crust',
    'Toppings':['mushrooms','sausage','bacon']
}

#Use the print() and get() functions
#Next, print out the customer's order:
#Thank them for their order using their name
#Print out what they're ordering
#Print out the list of toppings (minimum 3)
print("Thank you for choosing to order from us ", pizza_order.get('name'),"!",
          "\nYour order is a ", pizza_order.get('Size'),
          pizza_order.get('Crust'),
          "\nToppings include: \n",pizza_order.get('Toppings')
)