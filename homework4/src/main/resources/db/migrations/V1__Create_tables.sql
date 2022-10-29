CREATE TABLE post
(
    id   serial      NOT NULL,
    name varchar(30) NOT NULL,
    CONSTRAINT post_pk PRIMARY KEY (id)
);

CREATE TABLE teacher
(
    id                  serial      NOT NULL,
    post_id             int         NOT NULL,
    first_name          varchar(50) NOT NULL,
    second_name         varchar(50) NOT NULL,
    email               varchar(50) NOT NULL,
    phone               varchar(12),
    teaching_experience int,
    description         varchar(255),
    CONSTRAINT teacher_pk PRIMARY KEY (id)
);

CREATE TABLE course
(
    id          serial      NOT NULL,
    title       varchar(50) NOT NULL,
    description varchar(255),
    hours       int         NOT NULL,
    CONSTRAINT course_pk PRIMARY KEY (id)
);

CREATE TABLE student_group
(
    id        serial      NOT NULL,
    name      varchar(20) NOT NULL,
    course_id int         NOT NULL,
    CONSTRAINT student_group_pk PRIMARY KEY (id)
);

CREATE TABLE student
(
    id          serial      NOT NULL,
    first_name  varchar(50) NOT NULL,
    second_name varchar(50) NOT NULL,
    email       varchar(50) NOT NULL,
    phone       varchar(12),
    CONSTRAINT student_pk PRIMARY KEY (id)
);

CREATE TABLE enrollment
(
    id               serial NOT NULL,
    student_id       int    NOT NULL,
    student_group_id int    NOT NULL,
    CONSTRAINT enrollment_pk PRIMARY KEY (id)
);

CREATE TABLE lesson
(
    id          serial      NOT NULL,
    title       varchar(50) NOT NULL,
    description varchar(255),
    CONSTRAINT lesson_pk PRIMARY KEY (id)
);

CREATE TABLE schedule
(
    id               serial NOT NULL,
    teacher_id       int    NOT NULL,
    lesson_id        int    NOT NULL,
    student_group_id int    NOT NULL,
    start_time       TIMESTAMP,
    CONSTRAINT schedule_pk PRIMARY KEY (id)
);

CREATE TABLE home_task
(
    id               serial NOT NULL,
    max_points_count int    NOT NULL,
    lesson_id        int    NOT NULL,
    description      varchar(255),
    CONSTRAINT home_task_pk PRIMARY KEY (id)
);

CREATE TABLE attendance
(
    id         serial  NOT NULL,
    lesson_id  integer NOT NULL,
    student_id integer NOT NULL,
    CONSTRAINT attendance_pk PRIMARY KEY (id)
);

CREATE TABLE points_for_task
(
    id           serial NOT NULL,
    home_task_id int    NOT NULL,
    student_id   int    NOT NULL,
    points_count int    NOT NULL,
    CONSTRAINT points_for_task_pk PRIMARY KEY (id)
);

ALTER TABLE teacher
    ADD CONSTRAINT Teacher_fk0 FOREIGN KEY (post_id) REFERENCES post (id);

ALTER TABLE student_group
    ADD CONSTRAINT student_group_fk0 FOREIGN KEY (cource_id) REFERENCES course (id);

ALTER TABLE enrollment
    ADD CONSTRAINT enrollment_fk0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE enrollment
    ADD CONSTRAINT enrollment_fk1 FOREIGN KEY (student_group_id) REFERENCES student_group (id);

ALTER TABLE schedule
    ADD CONSTRAINT schedule_fk0 FOREIGN KEY (teacher_id) REFERENCES teacher (id);
ALTER TABLE schedule
    ADD CONSTRAINT schedule_fk1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);
ALTER TABLE schedule
    ADD CONSTRAINT schedule_fk2 FOREIGN KEY (student_group_id) REFERENCES student_group (id);

ALTER TABLE home_task
    ADD CONSTRAINT home_task_fk0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);

ALTER TABLE attendance
    ADD CONSTRAINT attendance_fk0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);
ALTER TABLE attendance
    ADD CONSTRAINT attendance_fk1 FOREIGN KEY (student_id) REFERENCES student (id);

ALTER TABLE points_for_task
    ADD CONSTRAINT points_for_task_fk0 FOREIGN KEY (home_task_id) REFERENCES home_task (id);
ALTER TABLE points_for_task
    ADD CONSTRAINT points_for_task_fk1 FOREIGN KEY (student_id) REFERENCES student (id);
