# FormBuilder
This rails application is to build dynamic forms. It doesn't have any UI.
There are 5 models - Form, Element, FormElements, FormData, User

Form - Used to store form details like name, description etc
Element - Used to store details of elements like name, data type etc to build a form. An element can belong to more than one form also. 
FormElement - Is a mapping between form and elements. It tells exactly what all elements is used to build a form.
FormData - Used to store details entered by used for a particular form. It is a mapping between user and form.
           A form can have many form data , as many users can fill the form.
           
