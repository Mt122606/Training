class Training:
    schools = []
    done = "I graduated "
    ready = "I graduate "
    def __init__(self, school, studied, year):
        self.studied = studied
        self.year = year
        self.school = school
        
    def display(self):
        """Instance method to display student info"""
        print("Name:", self.school, ", Year completed:", self.year)
        
    def assignment(self):
        print("At "+self.school.title()+
              "Student of "+self.studied.title()+"."+
              "project with skills, my accomplishments are . " + self.ready+" " +self.year.title())
    @staticmethod
    def general():
        print("I have a love for learning and have always made high marks in school. I believe putting what I learn in to action as I am learning it. I can then learn more about my limintations.")
    @staticmethod
    def add_school(school):
        """Class method for adding a student to the class var"""
        Training.schools.append(school) 
    @staticmethod   
    def display_school():
        """Class method for printing all students"""
        for school in Training.schools:
            school.display()

WOZU = Training('WOZU','Data science', '2023')
Ohio_University = Training('Ohio University','Social Science', 2018)
Training.general()
print('I went to ',WOZU.school,'and will obtain a degree of ',WOZU.studied,' in ',WOZU.year)

Training.add_school(WOZU)
Training.add_school(Ohio_University)
Training.display_school()



class purchasing:
        
    def __init__(self,company,year):
        self.company = company
        self.year = year


celeistica = purchasing("celeistica",2022)