class Form < ActiveRecord::Base
  has_many :form_elements
  has_many :elements, :through => :form_elements
  has_many :form_datas

  def load_form(user_id)
    fd =  FormData.find_by_form_id_and_user_id(self.id,user_id)
    if fd.present?
      puts "LOAD EXISTING FORM DATA.."
      fd.show_form
    else
      puts "CREATE NEW FORM DATA.."
      create_form(user_id)
    end
  end

  def create_form(user_id)
    fd = FormData.new()
    fd.user_id = user_id
    fd.form_id = self.id
    elements = self.form_elements
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
    fd.form_value = form_data_hash
    puts "FDVAL.. #{fd.inspect}"
    fd.save!
  end
end
