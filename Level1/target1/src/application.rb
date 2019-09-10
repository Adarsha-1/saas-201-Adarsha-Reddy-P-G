 require_relative './department' # Include other files in the same directory

# Your application
class Application
   attr_accessor :departments

  def initialize
     self.departments=[]
     #self.departments = ['EEE', 'MECH', 'CSE', 'CIVIL'].each { |dept| Department.new(dept) }
     ['EEE', 'MECH', 'CSE', 'CIVIL'].each do |dept| 
      self.departments<<Department.new(dept) 
    end
  end

  def show
    self.departments.each do |dept|
      dept.show
    end
  end

  def enroll(student_name, student_department)
     department = self.departments.detect { |dept| dept.get_name == student_department}
     section=department.get_section
     if section == 0
      puts "Seats are not available in #{student_department}"
    else
      sect=section[0]
      rollno=department.get_name+section
      department.add_rollno(student_name,rollno)
      "You have been enrolled to #{student_department}" \
      "\nYou have been allotted section #{sect}" \
      "\nYour roll number is #{rollno}"
    end
  end

  def change_dept(student_name, student_department)
    ## write some logic to frame the string below
    rollno=""
    old_dept=""
    self.departments.each do |dept|
      rollno=dept.get_details(student_name)
      #puts "previous rollno is #{rollno}"
      if rollno != nil
        i=-1
        while rollno[i]>='0' and rollno[i] <='9'
            i=i-1
        end
        #puts "Section is #{rollno[i]}"
        old_dept=dept
        #puts "old department is #{old_dept.get_name}"
        break
      end
    end
    oldroll=rollno
    department = self.departments.detect { |dept| dept.get_name == student_department}
    #puts "present required department is #{department.get_name}"
    if old_dept.get_name == department.get_name
      puts "Error: you are previously enrolled in the same department which you selected now i.e #{old_dept.get_name}"
    else
      section=department.get_section
      if section == 0
        "Seats are not available in #{student_department}" \
      else
        old_dept1=old_dept.get_name
        len=old_dept1.length
        num=rollno[len+1..rollno.length-1]
        #puts "roll no is #{num}"
        old_dept.remove_rollno(student_name,old_dept1,rollno)
        sect=section[0]
        rollno=department.get_name+section
        department.add_rollno(student_name,rollno)
        len=old_dept1.length
        old_dept.adjust_rollno(len,num,oldroll)
        "You have been enrolled to #{student_department}" \
        "\nYou have been allotted section #{sect}" \
        "\nYour roll number is #{rollno}"
      end
    end
  end

  def change_section(student_name,section)
    ## write some logic to frame the string below
    rollno=""
    old_dept=""
    list=""
    self.departments.each do |dept|
      rollno=dept.get_details(student_name)
      #puts "previous rollno is #{rollno}"
      if rollno != nil
        i=-1
        while rollno[i]>='0' and rollno[i] <='9'
            i=i-1
        end
        #puts "Section is #{rollno[i]}"
        old_dept=dept
        #puts "old department is #{old_dept.get_name}"
        break
      end
    end
    #old_dept1=""
    old_dept1=old_dept.get_name
    len=old_dept1.length
    psec=old_dept1[len]
    oldroll=rollno
    if psec == section
      list=list+"Error: you are already present in that section i.e #{psec}"
    else
      sectcnt=old_dept.get_seats_in_section(section)
      if sectcnt>=1
        old_dept1=old_dept.get_name
        len=old_dept1.length
        num=rollno[len+1..rollno.length-1]
        old_dept.remove_rollno(student_name,old_dept1,rollno)
        sect=old_dept.get_specific_section_rollno(section)
        rollno=old_dept.get_name+sect.to_s
        old_dept.add_rollno(student_name,rollno)
        len=old_dept1.length
        old_dept.adjust_rollno(len,num,oldroll)
        list=list+"You have been allotted section #{section}"
        list=list+"\nYour roll number is #{rollno}"
      else
        list=list+"seats are not available in #{Section} section"
      end
    end
    puts "test line"+list
    list
  end

  def department_view(student_dept)
    ## write some logic to frame the string below
    department = self.departments.detect { |dept| dept.get_name == student_dept}
    #puts "#{department}"
    #{}"List of students:"
    department.show_details
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    department = self.departments.detect { |dept| dept.get_name == student_dept}
    dept=department.get_name
    len=dept.length
    department.sec_show_details(section,len)
    #{}"List of students:" \
    #{}"\nTom - MECB01"
  end

  def student_details(student_name)
    ## write some logic to frame the string below
    flag=0
    list=""
    self.departments.each do |dept|                       
      rollno=dept.get_details(student_name) 
      depart=dept.get_name              
      if rollno != nil
        flag=1
        len=depart.length
        #puts"length is #{len}"
        sec=rollno[len]
        #puts"sec is #{sec}"
        list="#{student_name} - #{depart} - Section #{sec} - #{rollno}"
        break
      end
    end
    if flag == 0
      list=list+"No student is present with name #{student_name}"
    end
    #{}"Tom - MECH - Section B - MECB01"
    list
  end
end
