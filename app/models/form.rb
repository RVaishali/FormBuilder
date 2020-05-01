class Form < ActiveRecord::Base
  has_many :form_elements
  has_many :elements, :through => :form_elements
  has_many :form_datas

  def load_form(user_id)
    fd =  FormData.find_by_form_id_and_user_id(self.id,user_id)
    if fd.present?
      fd.show_form
    else
      create_form(user_id)
    end
  end

  def create_form(user_id)
    fd = FormData.new()
    fd.user_id = user_id
    fd.form_id = self.id
    elements = self.form_elements
    ele = elements.sort_by(&:priority)
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
          puts "Enter #{e_name}"
          val = gets.chomp()
          form_data_hash[e_name] = val
        end
      end
    end
    fd.form_value = form_data_hash
    if(!fd.save)
      puts "Invalid Entry. Press 1 to try again"
      num = gets.chomp.to_i
      if(num == 1)
        create_form(user_id)
      end
    else
      puts "Record Saved"
    end
  end

  def get_data
    puts "Enter User Id"
    id = gets.chomp.to_i
    self.load_form(id)
  end
end
