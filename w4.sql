
--Create the following tables in a database named "roster". Make sure that your database and tables are named exactly as follows including matching case.

DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS Course;

CREATE TABLE `User` (
    user_id     INTEGER NOT NULL AUTO_INCREMENT,
    name        VARCHAR(128) UNIQUE,
    PRIMARY KEY(user_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

CREATE TABLE Course (
    course_id     INTEGER NOT NULL AUTO_INCREMENT,
    title         VARCHAR(128) UNIQUE,
    PRIMARY KEY(course_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

CREATE TABLE Member (
    user_id       INTEGER,
    course_id     INTEGER,
    role          INTEGER,

    CONSTRAINT FOREIGN KEY (user_id) REFERENCES `User` (user_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES Course (course_id)
       ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (user_id, course_id)
) ENGINE=InnoDB CHARACTER SET=utf8;



--You will normalize the following data (each user gets different data), and insert the following data items into your database, creating and linking all the foreign keys properly. Encode instructor with a role of 1 and a learner with a role of 0.

Lyndsay, si106, Instructor
Eleanor, si106, Learner
Isha, si106, Learner
Kasra, si106, Learner
Muhamadjavad, si106, Learner
Raegan, si110, Instructor
Alayna, si110, Learner
Eugene, si110, Learner
Juanita, si110, Learner
Talorcan, si110, Learner
Tiarnan, si206, Instructor
Bryce, si206, Learner
Davie, si206, Learner
Emilia, si206, Learner
Kaelum, si206, Learner
You can test to see if your data has been entered properly with the following SQL statement.

SELECT `User`.name, Course.title, Member.role
    FROM `User` JOIN Member JOIN Course
    ON `User`.user_id = Member.user_id AND Member.course_id = Course.course_id
    ORDER BY Course.title, Member.role DESC, `User`.name
The order of the data and number of rows that comes back from this query should be the same as above. There should be no missing or extra data in your query.

--Here is a set of insert statements to achieve this assignment. Use can simply copy and paste the code into a file named as "roster.json" , and submit it.
-- code is given below


// Database 'roster'
// roster.Course

[{"course_id":"6","title":"si106"}, {"course_id":"6","title":"si106"},{"course_id":"6","title":"si106"},
{"course_id":"6","title":"si106"},{"course_id":"6","title":"si106"},{"course_id":"10","title":"si110"},
{"course_id":"10","title":"si110"},{"course_id":"10","title":"si110"},{"course_id":"10","title":"si110"},
{"course_id":"10","title":"si110"},{"course_id":"26","title":"si206"},{"course_id":"26","title":"si206"},
{"course_id":"26","title":"si206"},{"course_id":"26","title":"si206"},{"course_id":"26","title":"si206"}]

// roster.Member

[{"user_id":"1","course_id":"6","role":"1"},{"user_id":"2","course_id":"6","role":"0"},{"user_id":"3","course_id":"6","role":"0"},
{"user_id":"4","course_id":"6","role":"0"},{"user_id":"5","course_id":"6","role":"0"},{"user_id":"6","course_id":"10","role":"1"},
{"user_id":"7","course_id":"10","role":"0"},{"user_id":"8","course_id":"10","role":"0"},{"user_id":"9","course_id":"10","role":"0"},
{"user_id":"10","course_id":"10","role":"0"},{"user_id":"11","course_id":"26","role":"1"},{"user_id":"12","course_id":"26","role":"0"},
{"user_id":"13","course_id":"26","role":"0"},{"user_id":"14","course_id":"26","role":"0"},{"user_id":"15","course_id":"26","role":"0"}]

// roster.User

[{"user_id":"1","name":"Lyndsay"},{"user_id":"2","name":"Eleanor"},{"user_id":"3","name":"Isha"},
{"user_id":"4","name":"Kasra"},{"user_id":"5","name":"Muhamadjavad"},{"user_id":"6","name":"Raegan"},
{"user_id":"7","name":"Alayna"},{"user_id":"8","name":"Eugene"},{"user_id":"9","name":"Juanita"},
{"user_id":"10","name":"Talorcan"},{"user_id":"11","name":"Tiarnan"},{"user_id":"12","name":"Bryce"},
{"user_id":"13","name":"Davie"},{"user_id":"14","name":"Emilia"},{"user_id":"15","name":"Kaelum"}]



