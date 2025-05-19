document.addEventListener('DOMContentLoaded', function () {
	const termsInput = document.getElementById('terms');
	const form = document.getElementById('upload-video-form');
	const descriptionInput = document.getElementById('description');
	const tagsInput = document.getElementById('tags');
	const titleInput = document.getElementById('title');


	
//check terms, if not selected cant submit
form.addEventListener('submit', function (e) {
	let valid = true;

	// Title validation
	if (titleInput.value.trim().length < 5) {
		document.getElementById('titleError').textContent = "Title must be at least 5 characters.";
		valid = false;
	} else {
		document.getElementById('titleError').textContent = "";
	}

	// Description validation
	if (descriptionInput.value.trim().length < 15) {
		document.getElementById('descriptionError').textContent = "Description must be at least 15 characters.";
		valid = false;
	} else {
		document.getElementById('descriptionError').textContent = "";
	}

	// Tags validation
	const regex = /^[a-zA-Z0-9, ]*$/;
	if (!regex.test(tagsInput.value)) {
		document.getElementById('tagsError').textContent = "Tags can only contain letters, numbers, and commas.";
		valid = false;
	} else {
		document.getElementById('tagsError').textContent = "";
	}

	// Terms and conditions
	if (!termsInput.checked) {
		document.getElementById('termsError').textContent = "You must agree to the terms.";
		valid = false;
	} else {
		document.getElementById('termsError').textContent = "";
	}

	// Final check
	if (!valid) {
		e.preventDefault(); // prevent form from submitting
	}
});



});