<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <Title>Student Survey test</Title>
        <link rel="stylesheet" href="./style.css">
    </head>
    <body>
        <nav>
            <img class="gmu_Logo" src="./img/GMU_Logo.png" alt="GMU image" >
        </nav>
        <form id="studentForm">
            <h1>Student Survey T</h1>
            <div id="contactInfo">
                <div class="formItem half">
                    <label for="fname"><span class="required">*</span>First name:</label><br>
                    <input class="input" type="text" id="fname" name="fname">
                    <p class="error1 error">First name is required</p>
                </div>
                <div class="formItem half rightItem">
                    <label for="lname"><span class="required">*</span>Last name:</label><br>
                    <input class="input" type="text" id="lname" name="lname">
                    <p class="error2 error">Last name is required</p>
                </div><br>
                <div class="formItem">
                    <label for="address"><span class="required">*</span>Street Address:</label><br>
                    <input class="input" type="text" id="address" name="address">
                    <p class="error3 error">Street address is required</p>
                </div>
                <div class="formItem half rightItem ">
                    <label for="state"><span class="required">*</span>State:</label><br>
                    <input class="input" type="text" id="state" name="state">
                    <p class="error4 error">State is required</p>
                </div>
                <div class="formItem half">
                    <label for="zip"><span class="required">*</span>Zip Code:</label><br>
                    <input class="input" type="text" id="zip" name="zip">
                    <p class="error5 error">Zip code is required</p>
                </div>
                <div class="formItem">
                    <label for="email"><span class="required">*</span>Email Address:</label><br>
                    <input class="input" type="text" id="email" name="email">
                    <p class="error6 error">Email is required</p>
                </div>
                <div class="formItem half">
                    <label for="phoneNumber"><span class="required">*</span>Phone Number:</label><br>
                    <input class="input" type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}">
                    <p class="error7 error">Email is required</p>
                </div>
                <div class="formItem half rightItem">
                    <label for="date"><span class="required">*</span>Date of Survey:</label><br>
                    <input class="input" type="date" id="date" name="date">
                    <p class="error8 error">Date is required</p>
                </div>
            </div>
            <div id="questions">
                <div class="formItem">
                    <label for="studentSelection">What do you like most about our campus?</label><br>
                    <input type="checkbox" id="students" name="students" value="Students">
                    <label for="students"> Students</label><br>
                    <input type="checkbox" id="location" name="location" value="location">
                    <label for="location"> Location</label><br>
                    <input type="checkbox" id="campus" name="campus" value="campus">
                    <label for="campus"> Campus</label><br>
                    <input type="checkbox" id="atmosphere" name="atmosphere" value="atmosphere">
                    <label for="atmosphere"> Atmosphere</label><br>
                    <input type="checkbox" id="dormRooms" name="dormRooms" value="dormRooms">
                    <label for="dormRooms"> Dorm Rooms</label><br>
                    <input type="checkbox" id="sports" name="sports" value="sports">
                    <label for="sports"> Sports</label>
                </div>
                <div class="formItem">
                    <label for="interest">What interested you in our university?</label><br>
                    <input type="radio" id="friends" name="interest" value="friends">
                    <label for="friends">Friends</label><br>
                    <input type="radio" id="television" name="interest" value="television">
                    <label for="television">Television</label><br>
                    <input type="radio" id="internet" name="interest" value="internet">
                    <label for="internet">Internet</label><br>
                    <input type="radio" id="other" name="interest" value="other">
                    <label for="other">Other</label>
                </div>
                <div class="formItem">
                    <label for="recommending">Would you recommend our University to others?</label><br>
                    <select name="recommendation" id="recommendation" class="input"><br>
                        <option value="">None</option>
                        <option value="unlikley">Unlikley</option>
                        <option value="likely">Likely</option>
                        <option value="vlikley">Very Likely</option>
                    </select>
                </div>
                <div class="formItem">
                    <label for="raffle">Raffle (between 1 and 100):</label><br>
                    <input type="number" id="raffle" name="raffle" min="1" max="100"><br>
                    <p class="error6 errorSpecial">Must be between 1-100</p>
                </div>
                <div class="formItem">
                    <label for="raffle">Additional Comments:</label> <br>
                    <textarea id="freeform" name="freeform" rows="4" cols="50">
                    </textarea><br>
                </div>
            </div>
            <div id="buttons">
                <button type="button" class="form_Button cancel" onclick="cancelForm()">Cancel</button>
                <button type="button" class="form_Button submit" onclick="submitForm()">Submit</button>
            </div>
        </form>
        <footer>

        </footer>
        <script src="script.js"></script>
    </body>
</html>
