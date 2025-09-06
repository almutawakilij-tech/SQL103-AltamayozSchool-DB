-- Continuation of SQL101 and SQL102 Projects


-- Many-to-Many Relationships

-- The relationship between teachers and students (a teacher teaches more than one student, and a student is taught by more than one teacher)
CREATE TABLE Teacher_Student (
TeacherID INT,
StudentID INT,
PRIMARY KEY (TeacherID, StudentID),
FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Relationship between subjects and students (a student studying more than one subject, and a subject being studied by more than one student)
CREATE TABLE Student_Subject (
StudentID INT,
SubjectID INT,
PRIMARY KEY (StudentID, SubjectID),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);


-- Many-to-Many: Students and Subjects
CREATE TABLE Student_Subject (
student_id INT,
subject_id INT,
PRIMARY KEY (student_id, subject_id),
FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id) ON DELETE CASCADE
);


-- (Views)

-- Create a view for teachers and subjects
CREATE VIEW teacher_info AS
SELECT t.TeacherName, t.OfficeNumber, sub.SubjectName
FROM Teachers t
JOIN Subjects sub ON t.SubjectID = sub.SubjectID;

-- Display the view content
SELECT * FROM teacher_info;

-- Delete the view
DROP VIEW teacher_info;

-- (Index)

-- Create an index on student names
CREATE INDEX idx_student_name ON Students(StudentName);

-- Display indexes (MySQL)
SHOW INDEX FROM Students;

-- Delete the index
DROP INDEX idx_student_name ON Students;
