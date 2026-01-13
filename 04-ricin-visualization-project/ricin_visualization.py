# Transfer of database and data from SQL to Python
# The final database structure after being imported into Python can be seen below.

# Data visualization 
# 1) Function 1: Function 1 initializes the data and takes in the vertical height. The containment status would be that the protein contains other subunits; in cases that there are two levels of containment (that is, a protein containing a protein that contains a protein while it is functioning), the intention is to be also able to represent that. Furthermore, this should be able to represent proteins that contain multiple different subunits as well and be able to represent both cases. There were two approaches that attempted to solve this problem. The first method utilizes string splitting through regex, to extract the unit. This method was deemed not to be the one more befitting of the problem, due to the fact that there would be contrasting units that are going to be used in the database (some are in the form of mass that has kDA or mDA units, some come in length of nanometers). In addition, the two units would not accurately be able to be scaled to one another, and there is no way to represent containment of another unit through this method. This method would be useful for database cleanup and may have utility in the future, but for now this method is not the best fit. 

def mysplit(s):
    unit = re.sub(r'^\d+', "", s)
    value = s[:len(unit)]
    return value, unit
    
 	The second method was much more successful. By extracting the information of containment and counting the subunits, this allowed for a full recommendation of what vertical height each element should take on. This also allows for comparisons of which element is contained in the other, as the entity ID of each of the elements is unique, so when there is a level of nested containment, it can be properly displayed if needed. This method that is employed here would allow for the code to run recursively if needed; as the containment of subunits may not just be a single layer deal. 

# The real meat of the function
# Obtaining the entities that have "contains" across the three tables that have relationships listed

c.execute("select Entity_ID_1, count(*) from Relationships_1_1 WHERE Relationship = 'Contains' group by Entity_ID_1 ")
sizes1 = c.fetchall()

c.execute("select Entity_ID_1, count(*) from Relationships_1_2 WHERE Relationship = 'Contains' group by Entity_ID_1 ")
sizes2 = c.fetchall()

c.execute("select Entity_ID_1, count(*) from Relationships_1_3 WHERE Relationship = 'Contains' group by Entity_ID_1 ")
sizes3 = c.fetchall()

# Join into one table for calculation

joined = sizes1 + sizes2 + sizes3
"""
To print and check any of the tables: 

for x in joined: 
   print(x)

"""

# Joining the data and calculating a recommended height
# Currently the data does not have three-tier containment so this will suffice for now
# if there is containment within containment the user will need to further encompass that case

joineddata = pd.DataFrame.from_records(joined, columns=['Entity ID', 'Contains']).groupby('Entity ID').sum()

# The current recommended height formula is double the number of units it contains plus one, so that it can fully contain it
joineddata['Recommended Height'] = joineddata['Contains'] * 2 + 1
print(joineddata)

# joineddata['Recommended Height'] can be used as return value wrapped in a function
# for columns that do not have a value assigned here (i.e., the entities that don't contain other entities), the default height will be
# 2)	Function number two (2) (Creating the Initial Vertical Positions for Entities) in creating the vertical sizes of the entities and the Y-coordinates are assigned based on the entity’s size. The first chronological entity is at the top of the Y-axis followed by the next entity below the last and this continues until all entities have a vertical position as assigned. For example, if the Y-axis is 0 to 100 and Ricin (first entity) has a vertical size of 5, the Ricin’s vertical starting coordinates would be 100 and 95. If the next entity glycoprotein is size 4, its coordinates would be 94 and 90 and so on.
import random

coords_1-coords_0-data_coordinates[i][1]

c.execute(Select Entity_ID, Size FROM Entities) Select (Entity_2 FROM Relationships_1_1
Where Sub_Relationship! = Branches)

data_coordinates = c.fetchall()

coord_1 = coord_0-data_coordinates[i][1]

for i in range (0, len(data_coordinates)

def initial_vertical_positions(data: list [str, int], axis_y_length=100) -> list [str, int, int]:
data_coordinates = list () # will contain the pair of entity and coordinates
filled = 0 # will represent the filled amount in the y-axis, it is used to know where to put the next entity

for entity, size in data:
coords_0 = axis_y_length - filled # calculate the starting point
coords_1 = coords_0 - size # calculate the ending point
filled += size + 1 # update the filled size
data_coordinates.append((entity, coords_0, coords_1))
return data_coordinates
if __name__ == '__main__':
data = [(f'Entity-{x+1}', random.randint(1, 10)) for x in range (10)] # create test data
data_coordinates = initial_vertical_positions(data) # get coordinates of each entity
print(data)
print(data_coordinates)
 
# 3)	Earlier conversations about the overall visualization determined that Entities would be represented as rectangle shapes and that entities that needed to move through space via the Y axis would simply bend and maneuver their way while maintain a roughly rectangular appearance. Keeping this visualization in mind we determined the best way to graph entities in Plotly would be as scatterplots that formed rectangles with its points and connecting lines. The purpose of function 3 Function 3 was to create determine the coordinate positions needed to create each entity and then visualize each entity in Plotly. Function 3 can be broken down into three major parts; find the coordinates for all moving entities, that is all entities that traffic to some other entity and move along the vertical axis one or more times, find the coordinates of the nonmoving entities which are straight rectangles that only move along the X axis, and creating scatter plot traces for each entity.  The approach used for function 3 was to use SQLite queries to pull down nested lists containing the information needed to map the path of the entities. For moving entities this included information from trafficking relationships including the two entities involved, the start and end time of the relationship, and the vertical positions which would be loaded into the database from function 2. This information is stored into a double nested list in python where the 1st layer contains a list of each entity's trafficking relationships. The 2nd layer is a list of the information listed above for each trafficking relationship.
for i in range(0,len(Entities)):
     c.execute("Select Entity_ID_1, Entity_ID_2, Start_Time, End_Time "
           "FROM Relationships_1_2 WHERE Entity_ID_1 = ? AND Sub_Relationship = 'Traffic'", Entities[i])
     #store results in a temporary list
     temp_list = c.fetchall()
     #if temp_list is not empty append results to nested list
     if temp_list:
         Moving_Ent.append(temp_list)
Using a for loop to go through the list, each entities path is mapped out by creating a list of X coordinates and a list of Y coordinates. The X coordinate list is created by grabbing the start and end time for each trafficking relationship for each entity and appending it to a temporary list and appending that temporary list to the X coordinate list. Using a temporary list in this way makes the X coordinate list a nested list where each sublist is the list of x coordinates for a single entity. This keeps the coordinates organized by entity. After this each sublist has the beginning and end time of the entity’s existence added to the beginning and end of the trafficking coordinates. The Y coordinate list starts by grabbing the vertical position of the entity subtracted by its size from a separate list and then in a loop it adds the last element again and then adds the vertical position of the second entity in the trafficking relationship. After the loop the last element in each sublist is added again. The initial mapping algorithm only finds the path of the bottom line of the rectangle. Once each coordinate for the bottom line is found each list is put through a separate algorithm to create the top line and connecting lines. The algorithm creates a mirror of each list and adds the first element to the end as a last step to create the connecting line. The Y coordinate list adds the vertical size to each element as it mirrors it. 
Moving_Start_End_Coor=[]
 #for each element in the mvoing_ent list query entities table for start and end time of each entity found in Moving_ent list
 for i in range (0,len(Moving_Ent)):
     c.execute("Select Start_Time, End_Time From Entities Where Entity_ID = ?", (Moving_Ent[i][0][0],))
     #store each query result in temp_list
     temp_list = c.fetchall()
     #append temp_list contents to Moving_Start_End_coor list. This is to keep each query as a sublist and make Moving_Start_End_coor a nested list
     Moving_Start_End_Coor.append(temp_list)
 
list_Length = len(Moving_Ent)
 #for every item in moving entity list
 temp_xlist=[]
 for i in range(0,list_Length):
     list_length2 = len(Moving_Ent[i])
     x_coor.append(temp_xlist)
     temp_xlist=[]
    #for every sublist in index i of moving list get item 2 and 3 and append to x_coor list
     for z in range(list_length2):
         temp_xlist.append(Moving_Ent[i][z][2])
         temp_xlist.append(Moving_Ent[i][z][3])
 #append last version of temp_xlist to x_coor
 x_coor.append(temp_xlist)
 #remove empty list at beggining of x_coor
 x_coor.remove([])
 
#add start and end times of each entity to beggining and end of each entity sublist in x_coor
 #for each element in Moving_Start_End_Coor, insert the start time time of each entity into the same entity sublist in x_coor at index 0 of the sublist
 #then insert the end time after the last index position of the sublist
 for i in range(0,len(Moving_Start_End_Coor)):
     list_Length=len(x_coor[i]) + 1
     x_coor[i].insert(0, Moving_Start_End_Coor[i][0][0])
     x_coor[i].insert(list_Length, Moving_Start_End_Coor[i][0][1])
 
#get y coordinates for each moving Entity
 #create variable to control index during for loop to get y coordinates
 dummy_vert=[5,10,15,20,25,30]
 #for every item in moving entities list
 for i in range(0,len(Moving_Ent)):
     index=0
     list_length = len(Moving_Ent[i])
     ytemp_list=[]
     y_coor.append(ytemp_list)
     ytemp_list.append(dummy_vert[i])
     #make temporary list for keeping coordinates as a nested list by entity
     #for every sublist in item i add the last index of y_coor list and item 4 of the moving entity sub list
     for z in range(list_length):
         ytemp_list.insert(index + 1, ytemp_list[index])
         ytemp_list.append(Moving_Ent[i][z][3])
 #add two to index variable
         index+=2
 #insert final y coordinate position at end of each entity sublist
 for i in range(0,len(y_coor)):
     list_length=len(y_coor[i])
     y_coor[i].insert(list_length, y_coor[i][list_length-1])
 
#Algorithm for getting X coordinates of bottom half of entity rectangle
 
#establish index variable equal to the last index of list x_coor
 
#for every item in x_coor list append the item x of x_coor to the end of x_coor
 #subtract 1 from x at the end of each loop to get the next earliest item and append creating a mirror of the existing list after it
 #this mirror list will create the x_coor for the bottom line part of the entity rectangle
 for i in range(len(x_coor)):
     list_length = len(x_coor[i]) - 1
     for z in range(0,len(x_coor[i])):
         list_length2=len(x_coor[i])
         x_coor[i].insert(list_length2,x_coor[i][list_length])
         list_length=list_length-1
 #append the first item of the list again to the end of x_coor list to complete the rectangle x coordinates
 for i in range(len(x_coor)):
     list_length=len(x_coor[i])
     x_coor[i].insert(list_length + 1, x_coor[i][0])
 
#todo replace subtraction from y_coor with vertical size of entities
 for i in range(0,len(y_coor)):
     list_length=len(y_coor[i])-1
     for z in range(0,len(y_coor[i])):
         list_length2=len(y_coor[i])
         y_coor[i].insert(list_length2, int(y_coor[i][list_length])-5)
         list_length=list_length -1
 for i in range(len(y_coor)):
     list_length=len(y_coor[i])
     y_coor[i].insert(list_length + 1, y_coor[i][0])
After creation of the moving entity coordinate list the nonmoving entity list is created by querying for all entities and storing their start and end times, vertical size and starting position in a nested list. Then all the entities that were in the moving entity list are sliced out of the list leaving only the nonmoving entities. Then the start and end time are used to create the four corners of the rectangle on the X axis plus a connecting line. The Y coordinates for the four corners are created using the vertical position and then subtracting that by the size. After coordinate lists for the moving and nonmoving entities are created the two X coordinate lists are combined into one list and the Y coordinate lists are combined into one list. 
c.execute("Select Distinct(Entity_ID), Entities.Start_Time, Entities.End_Time From Entities "
           "Order By Entity_ID ASC"
           )
 tempNonMov_Ent=c.fetchall()
 
slice=[]
 for i in range(0,len(tempNonMov_Ent)):
     item = tempNonMov_Ent[i][0]
     if any(item in sl for sl in Moving_Ent_Info):
         slice.append(item)
 
NonMov_Ent = [e for e in tempNonMov_Ent if e[0] not in slice]
 NonMov_x_coor=[]
 for i in range(0,len(NonMov_Ent)):
     tempNonMov_x_coor=[]
     tempNonMov_x_coor.append(NonMov_Ent[i][1])
     tempNonMov_x_coor.append(NonMov_Ent[i][2])
     tempNonMov_x_coor.append(tempNonMov_x_coor[1])
     tempNonMov_x_coor.append(tempNonMov_x_coor[0])
     tempNonMov_x_coor.append(tempNonMov_x_coor[0])
     NonMov_x_coor.append(tempNonMov_x_coor)
 #todo replace indexes with vertical position and size indexes
 NonMov_y_coor=[]
 vert_positions=list(range(7,31))
 for i in range(1,len(vert_positions)):
     vert_positions[i] = vert_positions[i-1] + 7
 #test version
 print(vert_positions)
 for i in range(0,len(NonMov_Ent)):
     tempNonMov_y_coor = []
     tempNonMov_y_coor.append(vert_positions[i])
     tempNonMov_y_coor.append(vert_positions[i])
     tempNonMov_y_coor.append(tempNonMov_y_coor[1]-7)
     tempNonMov_y_coor.append(tempNonMov_y_coor[0]-7)
     tempNonMov_y_coor.append(tempNonMov_y_coor[0])
     NonMov_y_coor.append(tempNonMov_y_coor)
 print(NonMov_y_coor)
 


c.execute("Select Distinct(Entity_ID), Color, Purpose, Origin From Entities "
           "Order By Entity_ID ASC")
 tempNonMov_Ent_Info=c.fetchall()
 
slice2=[]
 for i in range(0,len(tempNonMov_Ent_Info)):
     item = tempNonMov_Ent_Info[i][0]
     if any(item in sl for sl in Moving_Ent_Info):
         slice.append(item)
 NonMov_Ent_Info = [e for e in tempNonMov_Ent if e[0] not in slice]
 
for i in range(0,len(NonMov_x_coor)):
     last_index=len(x_coor) -1
     x_coor.insert(last_index, NonMov_x_coor[i])
 for i in range(0,len(NonMov_y_coor)):
     last_index=len(y_coor) -1
     y_coor.insert(last_index, NonMov_y_coor[i])
 for i in range(0,len(NonMov_Ent_Info)):
     last_index=len(Moving_Ent_Info) -1
     Moving_Ent_Info.insert(last_index, NonMov_Ent_Info[i])
Using plotly graph objects, and a for loop, a scatterplot trace is added to the figure for each entity. The scatterplot uses a sublist from each of the X and Y coordinate lists for each entity to create the figure. A separate list can be used to add information such as name, hover over text, custom color etc. 
#create blank plotly figure to add scatterplot traces to
 fig = go.Figure()
 #create range variable for for loop that is half the length of the number of columns in the dataframe
 range_length = len(x_coor)
 #create variable to store indexes for columns during for loop
 col = 0
 #for every two columns in the dataframe add a scatter plot trace
 #where the 1st column is used as the x coordinates, the second column is the y coordinates. add two to column index variable at the end of each loop to move to next two columns
 for i in range(0,range_length):
     fig.add_trace(
         go.Scatter(
         x=x_coor[i], y=y_coor[i], name=Moving_Ent_Info[i][0]
         ))
     col +=2
 
fig.show()
# There are several things that still need to be added into function 3 or resolved. First is the creation of entities that arise as a branching event. A branching event is when an alternative timeline needs to be shown by branching off from the main timeline. This is done by branching off another version of the entity as the branching timepoint and taking it through an alternative timeline. An example in our Ricin timeline would be that some Ricin molecules, rather than be transported to early endosomes to continue in the cell are instead trafficked back to the membrane and exocytized. This is not the same as an entity creating a new entity as a product or being split into two new entities. After the initial branching event the current algorithm can map its path, but to add in its beginning coordinates it needs to be able to grab its coordinates at the time of branching since these entities do not have a defined vertical position. Another issue is that the algorithm will naturally only move an entity to sit on top of an entity (thus showing binding). If an entity needs to become contained within the entity this needs to be reflected with another event such as channeling. This can be easily incorporated into the list, however there may be times where an entity becomes contained within another entity without some intermediate event such as moving through a channel. The group still needs to develop a way to distinguish between these special cases of containment. Interestingly an unexpected consequence of programming the trafficking events this way is that they automatically create the binding visualization, rendering the binding relationships actions in the database redundant. 
# Another issue that was encountered during development was the case of moving entities while they are contained within another entity. Containment is meant to be visualized by an entity being centered within another entity (this can have multiple layers if necessary). When moving horizontally this can be work fine, but during vertical movements this visualization breaks down with the current code.  Because of the nature of the code, both entities are moved independently of one another by the algorithms. Because they are both moving to the same entity, they use the same Y coordinate position to move to. And because their trafficking relationship has the same start and end time, they use the same X coordinate position to move to. This results in the bottom lines of each entity becoming overlapped with each other by the time the trafficking event ends, and the inner entity is no longer centered within the outer entity. One potential way to solve this is to visualize containment with the two entities bottom lines being always overlapped instead of centered. To maintain the centering, however, some type of offset needs to be used to avoid overlap during this type of event. This proves difficult since it requires translating the vertical distance to a horizontal distance to offset which is complicated by the two axes being in different units and have different unit ranges. It could be possible to convert using proportions based on how many units are in each axis. This assumes that plotly will automatically fit different numbers of units into the same amount of space to keep each axis an equal length. Meaning 100 vertical units will take up an equal amount of space on the screen as 200 horizontal units. Therefore, by taking the total number of units in each axis, which can be known by the program, an offset algorithm could be created.

#4)	Function 4 serves the purpose of hiding entities within the visualization model. This function attempted to incorporate options for various GUI views- “Relevant View” and “Irrelevant View.” However, the code for the basic function (without the GUI components) can be extrapolated from the text below to simply operate on its own by asking the user simple questions without a GUI. It should be noted that, at the point of submission, it is uncertain whether the GUI code is operational as it is the beginning of a draft script in progress. On the other hand, the basic function code itself should work though, again, at the time of this submission, the group has not yet had the opportunity to test run the functions together, thus this has not been proven by the group. It should be noted that the construction of this function assumes that the plotly graph would be interactive within the GUI. The code for this function assumes the imports of the preceding functions.
import tkinter as t
from tkinter import *
from tkinter import messagebox
object = t.Tk()
#create def for button command actions to change view configurations
def view():
display.config(text = option.get())
#option datatype
option =  StringVar()
#set default menu option
option.set(“Relevant View”)
#menu choices
choices = [“Relevant View”, “Irrelevant View”]
#create drop-down menu with view options
view_menu = OptionMenu (object, option, *choices)
drop.pack()

#create sliding scale for relevance criteria or ask user for static input 
#ask user for static relevance/containment value
user_i = input (“How many children would you like your entities to contain in order for them to be viewed as ‘relevant’? ”)
#for each Entity ID in the Entities Table, select the entity ID and...
for Entity_ID in range(0,len(Entities)):
#if the user selects the “Relevant_View” option from the GUI drop-down menu
If  user_selection= (‘Relevant View’)
#test to see whether each entity in range above are relevant
def test_range_for_relevant_view_frame(n):
#if the object is permanent and the ‘Contains’ column is greater than or equal to user 	input
if Permanent = ‘Yes’ and Contains>=user_i
#then the object is considered relevant. Configure to display entity
    			config1 = {'display': true}
#else, if each entity in the range above is not permanent, they are not 		considered relevant. Configure to NOT display entity. 
else:
#configure to not display the Entity_ID
config1 = {'display': none}
#User display option two (I.e., “Irrelevant_View”) allows user to display all objects, including those that are irrelevant
else:
config2= {‘display’: true} 
 
view_button = Button(object, text=”View”, command = show).pack()
object.mainloop()
#5) Function 5 serves the purpose of explaining relationships or relationship actions through symbol language. As the analysis and interpretation of relationships between biological molecules, networks and concepts has become a priority in the communication of complex theories, there is increasing evidence of a major bottleneck in systems biology. Comprehension of individual structures and processes tend to be substantially less complicated than interconnected systems. Even more so when compared to interconnected systems which articulate at different timestamps. Very often the pure amount of data and their heterogeneity provides a challenge for the visualization of the data. When faced with an array of difficult to comprehend information, simply visualizing the data may not be enough. There are a wide variety of graph representations available, which most often map the data on 2D graphs to visualize biological interactions. These methods are applicable to a wide range of problems, nevertheless many of them reach a limit in terms of user friendliness when thousands of nodes and connections have to be analyzed and visualized. There is a common saying that a picture is worth a thousand words. With a visual image, no matter how small or how large, a massive amount of information can be conveyed to individuals of varying skill levels. At times, the only limiting factor regarding comprehension is a difference in culture and cumulative experience. 

#EXAMPLE 1

#The purpose of this code is to display an example of images being place in relation to chosen axes. My thought process is that when a particular entity was called upon by the user, the timestamp displayed within the plotly graph would be accompanied by an image conveying the type of relationship action occurring with said entity. Alternatively an image conveying no actions occurring or a stagnant entity could be used as well.

import plotly.express as px

df = px.data.iris()

fig = px.scatter(df, x="sepal_length", y="sepal_width", facet_col="species")

# sources of images

sources = [

"https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Iris_setosa_var._setosa_%282595031014%29.jpg/360px-Iris_setosa_var._setosa_%282595031014%29.jpg",

    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Iris_versicolor_quebec_1.jpg/320px-Iris_versicolor_quebec_1.jpg",

    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Iris_virginica_2.jpg/480px-Iris_virginica_2.jpg",

]

# add images

for col, src in enumerate(sources):

    fig.add_layout_image(

        row=1,

        col=col + 1,

        source=src,

        xref="x domain",

        yref="y domain",

        x=1,

        y=1,

        xanchor="right",

        yanchor="top",

        sizex=0.2,

        sizey=0.2,

    )

fig.show()

#The purpose of this code is to display an example of a symbol with a lighter opacity. By choosing to go this route, graphical aspects such as time stamp information, line markings and axes information can be intentionally unobscured while maintaining the goal of visually representing a type of relationship action. My hope is that upon further extrapolation by future users, symbols can be animated to fade in and out based upon the entities and time being selected.

EXAMPLE 2

fig = go.Figure()

# Add trace

fig.add_trace(

    go.Scatter(x=[0, 0.5, 1, 2, 2.2], y=[1.23, 2.5, 0.42, 3, 1])

)
# Add images

fig.add_layout_image(

        dict(

            source="https://images.plot.ly/language-icons/api-home/python-logo.png",

            xref="x",

            yref="y",

            x=0,

            y=3,

            sizex=2,

            sizey=2,

            sizing="stretch",

            opacity=0.5,

            layer="below")

)

 

#References: https://plotly.com/python/getting-started/ , https://plotly.com/python/images/

#Continuation of above example + integration into group’s dataset

#The purpose of this code is to display examples of how relationship actions from the SQL datasets could be reference to and subsequently linked to a particular image based on the relationship action of said entity. Utilizing the path variable, start time, end time, y position and y size from function one, two, three, the end user would be able to precisely display a particular symbol image based upon the relevant info of the chose entity.

# Set templates

fig.update_layout(template="plotly_white")

fig.show()

x=

for i in len of x

if x[i][0] = 'degrade'

y.append (degrade path variable)

y = [path variable, start time, end time, y position of entity]

for i in y fig.add_layout_image( dict{source = y[i][0], x=y[i][1], y=y[i][3]
IX)	Future Steps 
# One potential future step is that the user may desire to develop a graphical user interface (GUI) as indicated in preceding sections. As of right now, the code currently is still in its developmental stages, and details are being hammered out with regards to the visualization and handling data entry. Because of this, all the code is currently still a combination of SQL and Python codes; users need to know both languages to use the program and use the system. The manipulation of data would be difficult for a user without such prior knowledge. Therefore, for this group, the next goal of the project is to make it easier for users to use the GUI, without needing a full understanding of the data. 
#The group has also currently set up a GitHub repository, as the project has had valuable and important beginnings but is not yet complete and will not be completed within the brief time remaining this semester. The version control would allow us to have a consistent code that could be passed on to future researchers that would join in on this project. Currently the GitHub repository is simplistic, but it would have the opportunity to expand in the future as more gets added to the project. 
#Right now, the various functions have been built in a disparate manner and although they are being built to work together as each function is still being developed, they have not yet been combined to work together and feed data into one another. The functions must be combined into one tool and made to work together. The outputs for functions 1 and 2 need to be able to be added into the database tables so function 3 can easily access them during querying. Function 3 also needs further development to deal with the issues discussed in the function 3 section. 

