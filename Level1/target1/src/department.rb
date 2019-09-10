class Department
	attr_accessor :deptname , :sections, :studentslist
	def initialize(name)
		self.deptname=name
		self.sections={'A'=>10,'B'=>10,'C'=>10}
		self.studentslist={}
	end
	def show
		puts self.deptname
	end

	def show_details
		list="List of students:"
		studentslist.each do |key,val|
			list=list+"\n#{key} - #{val}"
		end
		#stu=""
		list
	end

	def sec_show_details(sect1,leng)
		flag=0
		list="List of students:"
		studentslist.each do |key,val|
			sect=val[leng]
			#i=-1
			#if val[i]=='0'
			#	if val[-2] == '1'
			#		sect=val[-3]
			#	else
			#		sect=val[-2]
			#	end
			#else
			#	sect=val[-2]
			#end
			#puts "#{val} is the sections"
			#puts "#{sect} is required"
			#puts "#{sect1} is given"
			if sect1 == sect
				list=list+"\n#{key} - #{val}"
				flag=1
			end
		end
		if flag == 0
			puts "Yet no students are enrolled in the section #{sect1}"
		end
		list
	end

	def get_sec_name(sec)
		sections[sec]
	end

	def get_section_name(name1)
		studentslist.each do |key,val|
			nam=key.upcase
			#puts "#{nam} name is"
			if key.downcase == name1.downcase
				return studentslist[name1]
			end
		end
	end
		

	def get_details(stud_name)
		studentslist[stud_name]
	end

	def get_name
		puts "Test line "+deptname
		deptname
	end

	def add_rollno(stud_name,rollno)
		studentslist[stud_name]=rollno
	end		

	def remove_rollno(stud_name,old_depart1,roll_no)
		studentslist.delete(stud_name)
		len=old_depart1.length
		sec=roll_no[len]
		self.sections[sec]=self.sections[sec]+1
	end

	def get_seats_in_section(section)
		 self.sections[section] 
	end

	def adjust_rollno(length,number,roll)
		roln=roll[0..length]
		#puts "#{roln}"
		studentslist.each do |key,val|
			len=val.length
			rollno=val[length+1..len-1]
			#puts "#{rollno}"
			n=rollno.to_i-1
			#puts "#{n} new"
			if rollno > number
				rollno=rollno.to_i-1
				number=format('%02d',n)
				studentslist[key]=roln+number.to_s
			end
			# 	rollno=rollno-1

		end
	end

	def get_specific_section_rollno(section)
		sect=10-self.sections[section]+1
		section1=format('%02d',sect)
		sect=section+section1.to_s
		self.sections[section]=self.sections[section]-1
		return sect
	end

	def get_section
		if self.sections['A'] >= 1
			sect=10-self.sections["A"]+1
			section=format('%02d',sect)
			sect='A'+section.to_s
			self.sections['A']=self.sections['A']-1
		elsif self.sections['B'] >=1
			sect=10-self.sections["B"]+1
			section=format('%02d',sect)
			sect='B'+section.to_s
			self.sections['B']=self.sections['B']-1
		elsif self.sections['C'] >= 1
			sect=10-self.sections["C"]+1
			section=format('%02d',sect)
			sect='C'+section.to_s
			self.sections['C']=self.sections['C']-1			
		else
			sect=0
		end
		return sect
	end

end


