// script.js

// Function to validate registration form before submission
function validateForm() {
    var username = document.forms["registrationForm"]["username"].value;
    var password = document.forms["registrationForm"]["userpass"].value;
    var category = document.forms["registrationForm"]["category"].value;
    var email = document.forms["registrationForm"]["email"].value;

    if (username == "") {
        alert("Username must be filled out");
        return false;
    }
    // Add more validation logic for other fields if needed

    return true;
}
