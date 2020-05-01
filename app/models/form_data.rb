class FormData < ActiveRecord::Base
  belongs_to :form
  belongs_to :user

  serialize :form_value
  before_save :valid?

  def valid?
    data_hash = self.form_value
    elements = self.form.elements
    type_valid = {}
    fe_valid = {}
    form_elements = self.form.form_elements
    elements.each do |e|
      value = data_hash[e.name]
      if(value.present?)
        #CHECK DATA TYPE
        if e.data_type == "Integer"
          mat = value.scan(/\d+/)
          if(mat.count == 1)
            type_valid[e.name] = true 
          else
            type_valid[e.name] = false
          end
        elsif(!value.is_a? eval(e.data_type))
          type_valid[e.name] = false
        else
          type_valid[e.name] = true
        end
        #CHECK FOR VALID CONDITION
        fe = form_elements.find_by_element_id(e.id)
        condition = fe.condition.try(:[],:valid)
        if(condition.present?)
          fe_valid[e.name] = eval(condition)
        else
          fe_valid[e.name] = true
        end
      end
    end
    if(type_valid.values.uniq.count == 1 && fe_valid.values.uniq.count ==1)
      if(type_valid.values[0] == true && fe_valid.values[0] == true)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def edit_form
    form = self.form
    elements = form.form_elements
    onload_elements = elements.find_all_by_onload(true)
    conditional_elements = elements.find_all_by_onload(false)
    ele = onload_elements + conditional_elements
    form_active_hash = {}
    form_data_hash = {}
    ele.each {|e| form_active_hash[e.element.name] = e.status}
    ele.each do |e|
      e_name = e.element.name
      if(form_active_hash[e_name] == "active")
        puts "Enter #{e_name}"
        val = gets.chomp()
        form_data_hash[e_name] = val 
      else
        if(e.to_show(form_data_hash))
          form_active_hash[e_name] = "active"
          puts "Enter .. #{e_name}"
          val = gets.chomp()
          form_data_hash[e_name] = val
        end
      end
    end
    self.form_value = form_data_hash
    if self.save
      puts "Form Data Saved"
    else
      puts "Invalid Data. Couldnt Save"
      edit_form
    end
  end

  def show_form
    data_hash = self.form_value
    data_hash.each do |key, value|
      puts "#{key} : #{value}"
    end
    puts "Press 1 to edit"
    inp = gets.chomp.to_i
    if(inp == 1)
      edit_form
    end
  end

end

