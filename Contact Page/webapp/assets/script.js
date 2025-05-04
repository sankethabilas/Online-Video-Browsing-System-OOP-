function toggleAnswer(questionElement) {
    const answer = questionElement.querySelector('.answer');
    answer.style.display = answer.style.display === "block" ? "none" : "block";
}
function toggleReadMore() {
    const content = document.getElementById("hiddenContent");
    content.classList.toggle("show");
}

