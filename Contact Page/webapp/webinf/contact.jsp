<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ Page</title>
    <link rel="stylesheet" href="assets/styles.css">
    <script src="assets/script.js" defer></script>
</head>
<body>
    <div class="container">
        <header>
            <h1>Frequently Asked Questions</h1>
            <p>Our virtual assistants are experienced professionals ready to manage your administrative and creative tasks.</p>
            <button class="btn" onclick="toggleReadMore()">Read more</button>

            <!-- Hidden paragraph -->
            <div id="hiddenContent" class="hidden-content">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce auctor nisl eget arcu luctus, a hendrerit nisi varius.</p>
            </div>
        </header>

        <section class="how-it-works">
            <h2>How It Works</h2>
            <div class="steps">
                <div class="step">
                    <span class="number">1</span>
                    <p>Tell us about your ideal assistant.</p>
                </div>
                <div class="step">
                    <span class="number">2</span>
                    <p>Meet and approve your assistant.</p>
                </div>
                <div class="step">
                    <span class="number">3</span>
                    <p>Launch and track.</p>
                </div>
            </div>
        </section>

        <section class="faq">
            <h2>Your Questions Answered</h2>
            <c:forEach var="faq" items="${faqs}">
                <div class="question" onclick="toggleAnswer(this)">
                    <p>${faq.msg}</p>
                    <div class="answer">Answer: ${faq.reply}</div>
                </div>
            </c:forEach>
        </section>

        <section class="contact">
            <h2>Contact Us</h2>
            <div class="contact-info">
                <p>Our Location: 11111 Kaduwela, Sri Lanka</p>
                <p>Email: info@videobrowsing.com</p>
                <p>Telephone: +94771234567</p>
            </div>
            <form method="post" action="contactservlet" id="contactForm" onsubmit="return validateForm()">
                <input type="text" class="aa" placeholder="First Name" name="fname" required>
                <input type="text" class="aa" placeholder="Last Name" name="lname" required><br>
                <input type="email" class="bb" placeholder="Email" name="email" required><br>
                <input type="tel" class="bb" placeholder="Phone" name="phone" required><br>
                <textarea placeholder="Enter your concern" class="bb" name="msg" required></textarea><br>
                <button type="submit" class="btn">Submit</button>
            </form>
        </section>

        <footer>
            <p>Spend less while getting the best virtual assistant services!</p>
            <button class="btn">Get started</button>
        </footer>

        <form action="adminservlet" method="post">
            <button type="submit">All Customers</button>
        </form>
    </div>

    <script>
        function validateForm() {
            const form = document.getElementById("contactForm");

            const fname = form["fname"].value.trim();
            const lname = form["lname"].value.trim();
            const email = form["email"].value.trim();
            const phone = form["phone"].value.trim();
            const msg = form["msg"].value.trim();

            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const phonePattern = /^0[0-9]{9}$/;
            const namePattern = /^[A-Za-z]+$/;

            if (fname === "" || lname === "" || email === "" || phone === "" || msg === "") {
                alert("Please fill out all fields.");
                return false;
            }

            if (!namePattern.test(fname) || !namePattern.test(lname)) {
                alert("First and Last Name should contain only letters without numbers or symbols.");
                return false;
            }

            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            if (!phonePattern.test(phone)) {
                alert("Please enter a valid 10-digit phone number starting with 0.");
                return false;
            }

            return true;
        }

        // Auto-redirect to contactservlet on page load (only if still on contact.jsp)
        window.onload = function () {
            if (window.location.pathname.endsWith("/contact.jsp")) {
                window.location.href = "contactservlet";
            }
        };
    </script>
</body>
</html>
