-- All the necessary tables for the University Organization of Our Textbook.
-- All the relationships are defined.

BEGIN;


CREATE TABLE IF NOT EXISTS public.department
(
    dept_name "char" NOT NULL,
    building "char" NOT NULL,
    budget money NOT NULL,
    CONSTRAINT department_pkey PRIMARY KEY (dept_name)
);

COMMENT ON TABLE public.department
    IS 'Table for Department.';

CREATE TABLE IF NOT EXISTS public.instructor
(
    "ID" smallint NOT NULL,
    name "char" NOT NULL,
    dept_name "char" NOT NULL,
    salary money NOT NULL,
    CONSTRAINT instructor_pkey PRIMARY KEY ("ID")
);

COMMENT ON TABLE public.instructor
    IS 'Column for instructor.';

CREATE TABLE IF NOT EXISTS public.student
(
    "ID" integer NOT NULL,
    name "char" NOT NULL,
    dept_name "char" NOT NULL,
    tot_cred smallint NOT NULL,
    CONSTRAINT student_pkey PRIMARY KEY ("ID")
);

COMMENT ON TABLE public.student
    IS 'student';

CREATE TABLE IF NOT EXISTS public.advisor
(
    "ID" smallint NOT NULL,
    "S-ID" integer NOT NULL
);

COMMENT ON TABLE public.advisor
    IS 'Table for Advisor.';

CREATE TABLE IF NOT EXISTS public.course
(
    course_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    title "char" NOT NULL,
    dept_name "char" NOT NULL,
    credits smallint NOT NULL
);

COMMENT ON TABLE public.course
    IS 'Table for Course.';

CREATE TABLE IF NOT EXISTS public.teaches
(
    "ID" smallint NOT NULL,
    course_id integer NOT NULL,
    sec_id integer NOT NULL,
    semester "char" NOT NULL,
    year integer NOT NULL,
    CONSTRAINT teaches_pkey PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public.takes
(
    "ID" smallint NOT NULL,
    course_id integer NOT NULL,
    sec_id integer NOT NULL,
    semester "char" NOT NULL,
    year integer NOT NULL,
    grade "char" NOT NULL,
    CONSTRAINT takes_pkey PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public.classroom
(
    room_number integer NOT NULL,
    building "char" NOT NULL,
    capacity integer NOT NULL,
    CONSTRAINT classroom_pkey PRIMARY KEY (room_number)
);

CREATE TABLE IF NOT EXISTS public.time_slot
(
    time_slot_id integer NOT NULL,
    day date NOT NULL,
    start_time timestamp(6) with time zone NOT NULL,
    end_time timestamp(6) with time zone NOT NULL,
    CONSTRAINT time_slot_pkey PRIMARY KEY (time_slot_id)
);

CREATE TABLE IF NOT EXISTS public.section
(
    course_id integer NOT NULL,
    sec_id integer NOT NULL,
    semester "char" NOT NULL,
    year integer NOT NULL,
    "building " "char" NOT NULL,
    room_number integer NOT NULL,
    time_slot_id integer NOT NULL,
    CONSTRAINT section_pkey PRIMARY KEY (sec_id)
);

COMMENT ON TABLE public.section
    IS 'Table for Section.';

CREATE TABLE IF NOT EXISTS public."pre-req"
(
    course_id integer NOT NULL,
    pre_req_id integer NOT NULL,
    CONSTRAINT "pre-req_pkey" PRIMARY KEY (pre_req_id)
);

ALTER TABLE IF EXISTS public.department
    ADD FOREIGN KEY (dept_name)
    REFERENCES public.instructor (dept_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.student
    ADD FOREIGN KEY (dept_name)
    REFERENCES public.department (dept_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.advisor
    ADD FOREIGN KEY ("S-ID")
    REFERENCES public.student ("ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.course
    ADD FOREIGN KEY (dept_name)
    REFERENCES public.department (dept_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.teaches
    ADD FOREIGN KEY (course_id)
    REFERENCES public.course (course_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.takes
    ADD FOREIGN KEY (course_id)
    REFERENCES public.course (course_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.section
    ADD FOREIGN KEY (course_id)
    REFERENCES public.course (course_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.section
    ADD FOREIGN KEY (room_number)
    REFERENCES public.classroom (room_number) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.section
    ADD FOREIGN KEY (time_slot_id)
    REFERENCES public.time_slot (time_slot_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.section
    ADD FOREIGN KEY ("building ")
    REFERENCES public.classroom (building) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."pre-req"
    ADD FOREIGN KEY (course_id)
    REFERENCES public.course (course_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
