<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ Page</title>
    <link rel="stylesheet" href="css/contact.css">
    <script src="js2/contact.js" defer></script>
</head>
<body>
    <div class="container">
        <header>
            <h1>Frequently Asked Questions</h1>
            <p>We've gathered the most common inquiries to help you quickly find answers about our services, features, and support. Additionally, any questions you've submitted through our Contact Us form can also be found here once they've been answered</p>
            <button class="btn" onclick="toggleReadMore()">Read more</button>

            <!-- Hidden paragraph -->
            <div id="hiddenContent" class="hidden-content">
                <p>Our service provides users with a seamless and reliable platform to explore and access high-quality content tailored to their needs. Whether you're looking for expert support, easy navigation, or fast performance, we are committed to delivering an exceptional user experience. Our dedicated team ensures regular updates and responsive assistance to keep everything running smoothly</p>
            </div>
        </header>

        <section class="how-it-works">
    <h2>How It Works</h2>
    <div class="steps">
        <div class="step">
            <span class="number">1</span>
            <p>Got a question? Just send it our way through the Contact Us form.</p>
        </div>
        <div class="step">
            <span class="number">2</span>
            <p>Wait for our friendly support team to review your message.</p>
        </div>
        <div class="step">
            <span class="number">3</span>
            <p>You'll receive a private email response, with permission asked before adding it as public in FAQ section.</p>
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
            alert("Your concern has been sent successfully ! ");

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