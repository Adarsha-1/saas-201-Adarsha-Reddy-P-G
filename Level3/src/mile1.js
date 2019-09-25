/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validateInputs(input)
{
    var phno= /^\d{10}$/;    
    var inputtxt=document.getElementById("ph");
    if((inputtxt.value.match(phno)))
    {
        var name=document.getElementById("name").value;
        var gmail1=document.getElementById("ph").value;
        var gmail=document.getElementById("gm");
        var pattern=/^[a-zA-Z0-9._-]+@[college]+\.edu$/;
        var e=document.getElementById("old");
        var pri_dept= e.options[e.selectedIndex].value;
        var e1=document.getElementById("new");
        var pri_dept1= e1.options[e1.selectedIndex].value;
        if((input.value.match(pattern)))
        {
            if(pri_dept.match(pri_dept1))
            {
                alert("Primary dept and secondry department should not be same");
            }
            else
            {
                document.getElementById('result_display').style.display = "block";
                document.getElementById('display').innerHTML =
                        "name: "+name+"\n"+"phno: "+gmail1+"\n"+"email: "+input.value+"\n"+"department1: "+pri_dept+"\n"+"department2: "+pri_dept1;
            }    
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
}

function changeSecondaryOption(){
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

function changePrimaryOption(){
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