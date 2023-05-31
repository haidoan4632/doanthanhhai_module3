var regex = /^[a-zA-Z0-9]+$/;
var inputField = document.getElementById("input_field");
var errorField = document.getElementById("error_field");
inputField.addEventListener("blur", function () {
    if (!regex.test(this.value)) {
        errorField.innerHTML = "Dữ liệu nhập vào không hợp lệ!";
    } else {
        errorField.innerHTML = "";
    }
});