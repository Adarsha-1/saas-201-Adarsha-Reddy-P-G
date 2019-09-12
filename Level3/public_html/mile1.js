/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function phonenumber(email)
{
    var phno= /^\d{10}$/;    
    var inputtxt=document.getElementById("ph");
    if((inputtxt.value.match(phno)))
    {
        var name=document.getElementById("name").value;
        var gmail1=document.getElementById("ph").value;
        var gmail=document.getElementById("gm");
        var pattern=/^[a-zA-Z0-9._-]+@[sastra]+\.edu$/;
        var e=document.getElementById("old");
        var pri_dept= e.options[e.selectedIndex].value;
        var e1=document.getElementById("new");
        var pri_dept1= e1.options[e1.selectedIndex].value;
        //document.getElementById('display').innerHTML = 
                    //name+gmail1+pri_dept+pri_dept1+email.value;
        
        /*var e=document.getElementById("old");
            var pri_dept= e.options[e.selectedIndex].value;
            var e1=document.getElementById("old");
            var se_dept= e1.options[e1.selectedIndex].value;
            document.getElementById('display').innerHTML = 
                   name+gmail1+pri_dept+sec_dept;
            /*var result="";
            result=result.concat("name");
            result=result.concat("Phone Number:");
            result=result.concat(gmail1);
            result=result.concat("G-mail:");
            result=result.concat(gmail.value);
            result=result.concat("Primary Department");
            result=result.concat(pri_dept);
            result=result.concat("Secondary Department");
            result=result.concat(sec_dept);
            document.getElementById('display').innerHTML = 
                    result;*/
        if((email.value.match(pattern)))
        {
            /*var result="name:";
            result=result.concat(name);
            result=result.concat("/n");
            result=result.concat("Phone Number:");
            result=result.concat(gmail1);
            result=result.concat("Email:");
            result=result.concat(email.value);
            result=result.concat("Primary Department:");
            result=result.concat(pri_dept);
            result=result.concat("Secondary Department:");
            result=result.concat(pri_dept1);*/
            document.getElementById('display').innerHTML = 
                    "name: "+name+"\n"+"phno: "+gmail1+"\n"+"email: "+email.value+"\n"+"department1: "+pri_dept+"\n"+"department2: "+pri_dept1;
            /*result=result.concat("Phone Number:");
            result=result.concat(gmail1);
            result=result.concat("G-mail:");
            result=result.concat(gmail.value);
            result=result.concat("Primary Department");
            result=result.concat(pri_dept);
            result=result.concat("Secondary Department");
            result=result.concat(se_dept);
            document.getElementById('display').innerHTML = 
                    result;*/
            
        }
        else
        {
            alert("GMAIl format should be ex@college.edu");
            return false;
        }
        
    }
    else
    {
        alert("PHONE NUMBER should be 10 digits");
        return false;
    }
    //document.getElementsById("display")=name;
}

function dosomething(){
  var selected = $("#old").find('option:selected');
  var extra = selected.data('id'); 
  
  $('#new option').prop('disabled', false);
  
  $("#new > option").each(function() {
    var data=$(this).data('id');
    if(parseInt(data)==parseInt(extra)){
    	console.log(data);
    	$(this).prop('disabled',true);
    }
	});
}
function showInput1() {
        var text="adarsha";
        var text1="reddy";
        var res=text.concat(text1);
        var name1=document.getElementByID("name").value;
        var phone1=document.getElementByID("ph").value;
        var res1=name1.concat(phone1);
        document.getElementById('display').innerHTML = 
                    document.getElementById("name").value;
    }
function showInput()
{
    var name;
    var phonenumber=/^\d{10}$/;
    var email;
    var pri_dept;
    var sec_dept;
    var tex="Display message:\n";
    var i_name=document.getElementsById('name').value;
    var i_phn=document.getElementsByName('phone').value;
    var i_email=document.getElementsByName('email').value;
    
    if(i_phn.match(phonenumber))
    {
        tex=tex+i_phn;
    }
    else
    {
        alert("PHONE NUMBER should be 10 digits");
    }
    document.getElementsById('display').innerHTML=tex;
}
function myFunction1()
{
    var name=document.getElementByID("name").value;
    var n="Adarsha";
    document.getElementByID("display").innerHTML=document.getElementByID("name").value;
}
function dosomething1(){
  var selected = $("#new").find('option:selected');
  var extra = selected.data('id'); 
  
  $('#old option').prop('disabled', false);
  
  $("#old > option").each(function() {
    var data=$(this).data('id');
    if(parseInt(data)==parseInt(extra)){
    	console.log(data);
    	$(this).prop('disabled',true);
    }
	});
}