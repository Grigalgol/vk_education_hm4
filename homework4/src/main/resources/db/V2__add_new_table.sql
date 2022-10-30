CREATE TABLE points_for_task
(
    id           serial NOT NULL,
    home_task_id int    NOT NULL,
    student_id   int    NOT NULL,
    points_count int    NOT NULL,
    CONSTRAINT points_for_task_pk PRIMARY KEY (id)
);

ALTER TABLE points_for_task
    ADD CONSTRAINT points_for_task_fk0 FOREIGN KEY (home_task_id) REFERENCES home_task (id);
ALTER TABLE points_for_task
    ADD CONSTRAINT points_for_task_fk1 FOREIGN KEY (student_id) REFERENCES student (id);
