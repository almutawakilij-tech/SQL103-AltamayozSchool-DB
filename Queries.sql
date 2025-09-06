-- مشروع SQL103 - Altamayoz School
-- تكملة لمشروعي SQL101 و SQL102

/* --------------------------------------------------
   العلاقات Many-to-Many
-------------------------------------------------- */

-- العلاقة بين المعلمين والطلاب (معلم يدرّس أكثر من طالب والطالب يدرسه أكثر من معلم)
CREATE TABLE Teacher_Student (
    TeacherID INT,
    StudentID INT,
    PRIMARY KEY (TeacherID, StudentID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);


-- العلاقة بين المواد والطلاب (طالب يدرس أكثر من مادة، والمادة يدرسها أكثر من طالب)
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

/* --------------------------------------------------
   Views
-------------------------------------------------- */

-- إنشاء view للمعلمين والمواد
CREATE VIEW teacher_info AS
SELECT t.TeacherName, t.OfficeNumber, sub.SubjectName
FROM Teachers t
JOIN Subjects sub ON t.SubjectID = sub.SubjectID;

-- عرض محتوى الـ view
SELECT * FROM teacher_info;

-- حذف الـ view
DROP VIEW teacher_info;

/* --------------------------------------------------
   Index
-------------------------------------------------- */

-- إنشاء index على أسماء الطلاب
CREATE INDEX idx_student_name ON Students(StudentName);

-- عرض الفهارس (MySQL)
SHOW INDEX FROM Students;

-- حذف الـ index
DROP INDEX idx_student_name ON Students;
