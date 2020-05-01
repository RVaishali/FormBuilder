# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
f = Form.new
f.name = "ticket system"
f.description = "Check dynamic form"
f.save

e1 = Element.create({:name => 'CreatedBy', :data_type => 'String'})
e2 = Element.create({:name => 'Description', :data_type => 'String'})
e3 = Element.create({:name => 'Severity', :data_type => 'Integer'})
e4 = Element.create({:name => 'Status', :data_type => 'String'})
e5 = Element.create({:name => 'CancelledReason', :data_type => 'String'})
e6 = Element.create({:name => 'CancelledOtherDescription', :data_type => 'String'})
e7 = Element.create({:name => 'Comments', :data_type => 'String'})


fe1 = FormElement.create({:form_id => 1, :element_id => 1, :onload => true, :status => 'active'})
fe2 = FormElement.create({:form_id => 1, :element_id => 2, :onload => true, :status => 'active'})
fe3 = FormElement.create({:form_id => 1, :element_id => 3, :onload => true, :status => 'active'})
fe4 = FormElement.create({:form_id => 1, :element_id => 4, :onload => 
	true, :status => 'active'})
fe4.condition = {:valid=>"(['CANCELLED', 
	'COMPLETED'].include?(data_hash['Status']))"}
fe4.save
fe5 = FormElement.create({:form_id => 1, :element_id => 5, :onload => 
	false, :status => 'inactive'})
fe5.condition = {:valid=>"v = true; v = ['ENDUSER','OTHERS'].include?(data_hash['CancelledReason'].upcase) if(data_hash['CancelledReason'].present?); return v;", :to_show=>"((data_hash['Status'] == 'CANCELLED') ? true : false)"}
fe5.save
fe6 = FormElement.create({:form_id => 1, :element_id => 6, :onload => 
	false, :status => 'inactive'})
fe6.condition = {:to_show=>"((data_hash['Status'] == 'CANCELLED') ? true : false)"}
fe6.save
fe7 = FormElement.create({:form_id => 1, :element_id => 7, :onload => true, :status => 'active'})

