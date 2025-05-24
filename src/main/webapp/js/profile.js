// Profile Picture Upload Handling
document.addEventListener('DOMContentLoaded', function() {
    // Personal Information Form Handling
    const personalInfoForm = document.getElementById('personalInfoForm');
    const editPersonalInfoBtn = document.getElementById('editPersonalInfo');
    const cancelPersonalInfoBtn = document.getElementById('cancelPersonalInfo');
    const savePersonalInfoBtn = document.getElementById('savePersonalInfo');
    const personalInfoActions = document.getElementById('personalInfoActions');
    const formInputs = personalInfoForm.querySelectorAll('input[readonly]');

    // Enable form editing
    editPersonalInfoBtn.addEventListener('click', function() {
        formInputs.forEach(input => {
            input.removeAttribute('readonly');
        });
        personalInfoActions.classList.remove('d-none');
        editPersonalInfoBtn.classList.add('d-none');
    });

    // Cancel editing
    cancelPersonalInfoBtn.addEventListener('click', function() {
        formInputs.forEach(input => {
            input.setAttribute('readonly', 'readonly');
            // Reset to original values
            const originalValue = input.getAttribute('data-original-value');
            if (originalValue) {
                input.value = originalValue;
            }
        });
        personalInfoActions.classList.add('d-none');
        editPersonalInfoBtn.classList.remove('d-none');
    });

    // Save changes
    personalInfoForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Validate form
        if (!personalInfoForm.checkValidity()) {
            e.stopPropagation();
            personalInfoForm.classList.add('was-validated');
            return;
        }

        // Show loading spinner
        document.querySelector('.loading-spinner').classList.add('show');

        // Create FormData
        const formData = new FormData(personalInfoForm);

        // Send update request
        fetch('UpdateProfileServlet', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            // Hide loading spinner
            document.querySelector('.loading-spinner').classList.remove('show');
            
            // Show success message
            showToast('Profile updated successfully', 'success');
            
            // Update original values
            formInputs.forEach(input => {
                input.setAttribute('data-original-value', input.value);
                input.setAttribute('readonly', 'readonly');
            });
            
            // Hide edit buttons
            personalInfoActions.classList.add('d-none');
            editPersonalInfoBtn.classList.remove('d-none');
            
            // Remove validation styling
            personalInfoForm.classList.remove('was-validated');
        })
        .catch(error => {
            // Hide loading spinner
            document.querySelector('.loading-spinner').classList.remove('show');
            
            // Show error message
            showToast('Error updating profile', 'error');
            console.error('Error:', error);
        });
    });

    // Store original values when page loads
    formInputs.forEach(input => {
        input.setAttribute('data-original-value', input.value);
    });

    // Profile Picture Upload Handling
    const profilePictureForm = document.getElementById('profilePictureForm');
    const uploadPictureBtn = document.getElementById('uploadPictureBtn');
    const profilePictureInput = document.getElementById('profilePicture');
    const imagePreview = document.getElementById('imagePreview');
    const previewContainer = document.querySelector('.preview-container');

    // Show image preview when file is selected
    profilePictureInput.addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                imagePreview.src = e.target.result;
                previewContainer.classList.remove('d-none');
            }
            reader.readAsDataURL(file);
        }
    });

    // Handle upload button click
    uploadPictureBtn.addEventListener('click', function() {
        const file = profilePictureInput.files[0];
        if (!file) {
            showToast('Please select a file first', 'error');
            return;
        }

        // Validate file type
        const validTypes = ['image/jpeg', 'image/png', 'image/gif'];
        if (!validTypes.includes(file.type)) {
            showToast('Please select a valid image file (JPG, PNG, GIF)', 'error');
            return;
        }

        // Validate file size (5MB max)
        const maxSize = 5 * 1024 * 1024; // 5MB in bytes
        if (file.size > maxSize) {
            showToast('File size should not exceed 5MB', 'error');
            return;
        }

        // Create FormData and submit
        const formData = new FormData(profilePictureForm);
        
        // Show loading spinner
        document.querySelector('.loading-spinner').classList.add('show');

        fetch('UserProfilePictureUpdateServlet', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            // Hide loading spinner
            document.querySelector('.loading-spinner').classList.remove('show');
            
            // Close modal
            const modal = bootstrap.Modal.getInstance(document.getElementById('changePictureModal'));
            modal.hide();
            
            // Show success message
            showToast('Profile picture updated successfully', 'success');
            
            // Reload page after a short delay
            setTimeout(() => {
                window.location.reload();
            }, 1500);
        })
        .catch(error => {
            // Hide loading spinner
            document.querySelector('.loading-spinner').classList.remove('show');
            
            // Show error message
            showToast('Error updating profile picture', 'error');
            console.error('Error:', error);
        });
    });

    // Password Change Form Handling
    const changePasswordForm = document.getElementById('changePasswordForm');
    const togglePasswordFormBtn = document.getElementById('togglePasswordForm');
    const cancelPasswordChangeBtn = document.getElementById('cancelPasswordChange');
    const newPasswordInput = document.getElementById('newPassword');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const passwordStrengthBar = document.querySelector('.password-strength .progress-bar');
    const passwordStrengthText = document.querySelector('.password-strength-text');
    const requirements = document.querySelectorAll('.requirement');

    // Toggle password form visibility
    togglePasswordFormBtn.addEventListener('click', function() {
        changePasswordForm.classList.toggle('d-none');
    });

    // Cancel password change
    cancelPasswordChangeBtn.addEventListener('click', function() {
        changePasswordForm.classList.add('d-none');
        changePasswordForm.reset();
        resetPasswordValidation();
    });

    // Password strength checker
    function checkPasswordStrength(password) {
        let strength = 0;
        const requirements = {
            length: password.length >= 8,
            letter: /[A-Za-z]/.test(password),
            number: /[0-9]/.test(password),
            special: /[!@#$%^&*(),.?":{}|<>]/.test(password)
        };

        // Update requirement indicators
        Object.keys(requirements).forEach(req => {
            const element = document.querySelector(`[data-requirement="${req}"] i`);
            if (requirements[req]) {
                element.className = 'fas fa-check-circle text-success me-2';
                strength++;
            } else {
                element.className = 'fas fa-times-circle text-danger me-2';
            }
        });

        // Update strength bar and text
        const strengthPercentage = (strength / 4) * 100;
        passwordStrengthBar.style.width = `${strengthPercentage}%`;
        
        if (strengthPercentage <= 25) {
            passwordStrengthBar.className = 'progress-bar bg-danger';
            passwordStrengthText.textContent = 'Too weak';
        } else if (strengthPercentage <= 50) {
            passwordStrengthBar.className = 'progress-bar bg-warning';
            passwordStrengthText.textContent = 'Weak';
        } else if (strengthPercentage <= 75) {
            passwordStrengthBar.className = 'progress-bar bg-info';
            passwordStrengthText.textContent = 'Good';
        } else {
            passwordStrengthBar.className = 'progress-bar bg-success';
            passwordStrengthText.textContent = 'Strong';
        }

        return strength === 4;
    }

    // Reset password validation
    function resetPasswordValidation() {
        passwordStrengthBar.style.width = '0%';
        passwordStrengthBar.className = 'progress-bar';
        passwordStrengthText.textContent = 'Too weak';
        requirements.forEach(req => {
            req.querySelector('i').className = 'fas fa-times-circle text-danger me-2';
        });
    }

    // Check password match
    function checkPasswordMatch() {
        const newPassword = newPasswordInput.value;
        const confirmPassword = confirmPasswordInput.value;
        
        if (confirmPassword && newPassword !== confirmPassword) {
            confirmPasswordInput.setCustomValidity('Passwords do not match');
        } else {
            confirmPasswordInput.setCustomValidity('');
        }
    }

    // Add event listeners for password validation
    newPasswordInput.addEventListener('input', function() {
        checkPasswordStrength(this.value);
        checkPasswordMatch();
    });

    confirmPasswordInput.addEventListener('input', checkPasswordMatch);

    // Handle password change form submission
    changePasswordForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Validate form
        if (!changePasswordForm.checkValidity()) {
            e.stopPropagation();
            changePasswordForm.classList.add('was-validated');
            return;
        }

        // Validate password strength
        if (!checkPasswordStrength(newPasswordInput.value)) {
            showToast('Please ensure your password meets all requirements', 'error');
            return;
        }

        // Validate password match
        if (newPasswordInput.value !== confirmPasswordInput.value) {
            showToast('Passwords do not match', 'error');
            return;
        }

        // Show loading spinner
        document.querySelector('.loading-spinner').classList.add('show');

        // Create FormData
        const formData = new FormData(changePasswordForm);

        // Send update request
        fetch('ChangePasswordServlet', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            // Hide loading spinner
            document.querySelector('.loading-spinner').classList.remove('show');
            
            // Show success message
            showToast('Password updated successfully', 'success');
            
            // Reset form and hide it
            changePasswordForm.reset();
            changePasswordForm.classList.add('d-none');
            resetPasswordValidation();
            
            // Remove validation styling
            changePasswordForm.classList.remove('was-validated');
        })
        .catch(error => {
            // Hide loading spinner
            document.querySelector('.loading-spinner').classList.remove('show');
            
            // Show error message
            showToast('Error updating password', 'error');
            console.error('Error:', error);
        });
    });
});

// Toast notification function
function showToast(message, type = 'success') {
    const toastContainer = document.querySelector('.toast-container');
    const toast = document.createElement('div');
    toast.className = `toast custom-toast bg-${type} text-white`;
    toast.setAttribute('role', 'alert');
    toast.setAttribute('aria-live', 'assertive');
    toast.setAttribute('aria-atomic', 'true');
    
    toast.innerHTML = `
        <div class="toast-body">
            ${message}
        </div>
    `;
    
    toastContainer.appendChild(toast);
    
    const bsToast = new bootstrap.Toast(toast, {
        autohide: true,
        delay: 3000
    });
    
    bsToast.show();
    
    // Remove toast after it's hidden
    toast.addEventListener('hidden.bs.toast', function() {
        toast.remove();
    });
}

// Password visibility toggle
document.querySelectorAll('.toggle-password').forEach(button => {
    button.addEventListener('click', function() {
        const input = this.previousElementSibling;
        const icon = this.querySelector('i');
        
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    });
});
