
const fName = document.querySelector("#fname");
const lName = document.querySelector("#lname");
const address = document.querySelector("#address");
const state = document.querySelector("#state");
const zip = document.querySelector("#zip");
const email = document.querySelector("#email");
const phoneNumber = document.querySelector("#phoneNumber");
const date = document.querySelector("#date");
const raffle = document.querySelector("#raffle");

var formArray = [fName, lName, address, state, zip, email, phoneNumber, date];


function error(){
    var error = false;

    for(var x = 0; x < formArray.length; x++){
        if(formArray[x].value == ""){
            error = true;
            var errorNumber = "error" + (x+1);
            document.querySelector("." + errorNumber).style.display = 'block';
        }
    }
    if(specialError()){
        error = true;
    };
    return error;
}

function specialError() {
    var specialError = false;
    var raffleValue = parseInt(raffle.value);
    if (raffleValue < 1 || raffleValue > 100) {
        specialError = true;
        document.querySelector(".errorSpecial").style.display = 'block';
    }
    return specialError;
}

function clearErrors(){
    for(var x = 0; x < formArray.length; x++){
        var errorNumber = "error" + (x+1);
        document.querySelector("." + errorNumber).style.display = 'none';
        document.querySelector(".errorSpecial").style.display = 'none';
    }
}

function clearForm(){
    document.getElementById("studentForm").reset();
}

function submitForm(){
    clearErrors();
    if(error()){
        return;
    }

    window.alert("Submitted!");

    clearForm();
}

function cancelForm(){
    clearForm();
}
