INSERT INTO post (name)
VALUES ('Senior Programmer'),
       ('Middle Programmer');

INSERT INTO teacher (post_id, first_name, second_name, email, phone, teaching_experience, description)
VALUES (1, 'Alex', 'Petrov', 'alexpetrov@mail.ru', '+79871234567', 2, 'Java teacher'),
       (2, 'Ivan', 'Ivanov', 'ivanivanov@mail.ru', '+71231231212', 3, 'Java/Kotlin teacher'),
       (1, 'Maria', 'Ivanova', 'mariadb@mail.ru', '+79998887766', 2, 'NoSQL teacher');

INSERT INTO course (title, description, hours)
VALUES ('Java', 'Java advance course', 70),
       ('GameDev', 'GameDev advance course', 60);

INSERT INTO student_group (name, course_id)
VALUES ('Java-11', 1),
       ('GameDev-13', 2);

INSERT INTO student (first_name, second_name, email, phone)
VALUES ('Gregory', 'Gol', 'gregory@mail.ru', '+79121231232'),
       ('Andrew', 'Korabl', 'anrew@mail.ru', '+71912923344'),
       ('Daria', 'Bobr', 'bobr@mail.ru', '+76541235655'),
       ('Ivan', 'Vasilev', 'vasilev@mail.ru', '+791231231299');

INSERT INTO enrollment (student_id, student_group_id)
VALUES (1, 1),
       (2, 1),
       (3, 2),
       (4, 2);

INSERT INTO lesson (title, description)
VALUES ('Gradle', 'make gradle project'),
       ('DI Guice', 'dependency injection'),
       ('Unity', 'make game'),
       ('Sql', 'sql lesson');

INSERT INTO schedule (teacher_id, lesson_id, student_group_id, start_time)
VALUES (1, 1, 1, '2022-12-15 17:59:59'),
       (2, 2, 1, '2022-12-17 18:00:00'),
       (3, 3, 2, '2022-12-16 18:00:00'),
       (1, 4, 2, '2022-12-19 18:00:00');

INSERT INTO home_task (max_points_count, lesson_id, description)
VALUES (5, 1, 'hometask1'),
       (10, 2, 'hometask2'),
       (8, 3, 'hometask3'),
       (4, 4, 'hometask4');

INSERT INTO attendance (lesson_id, student_id)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 2),
       (3, 3),
       (3, 4),
       (4, 3);

INSERT INTO points_for_task (home_task_id, student_id, points_count)
VALUES (1, 1, 5),
       (1, 2, 5),
       (2, 1, 9),
       (2, 2, 9),
       (3, 3, 7),
       (3, 4, 2),
       (4, 3, 3);