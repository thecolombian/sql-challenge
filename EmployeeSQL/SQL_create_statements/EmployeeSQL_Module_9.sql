/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : PostgreSQL
 Source Server Version : 160003
 Source Host           : 127.0.0.1:5432
 Source Catalog        : EmployeeSQL
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160003
 File Encoding         : 65001

 Date: 23/07/2024 12:15:19
*/


-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS "public"."departments";
CREATE TABLE "public"."departments" (
  "dept_no" char(4) COLLATE "pg_catalog"."default" NOT NULL,
  "dept_name" varchar(40) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."departments" OWNER TO "postgres";

-- ----------------------------
-- Table structure for dept_emp
-- ----------------------------
DROP TABLE IF EXISTS "public"."dept_emp";
CREATE TABLE "public"."dept_emp" (
  "emp_no" int4 NOT NULL,
  "dept_no" char(4) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."dept_emp" OWNER TO "postgres";

-- ----------------------------
-- Table structure for dept_manager
-- ----------------------------
DROP TABLE IF EXISTS "public"."dept_manager";
CREATE TABLE "public"."dept_manager" (
  "emp_no" int4 NOT NULL,
  "dept_no" char(4) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."dept_manager" OWNER TO "postgres";

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS "public"."employees";
CREATE TABLE "public"."employees" (
  "emp_no" int4 NOT NULL,
  "emp_title_id" char(5) COLLATE "pg_catalog"."default" NOT NULL,
  "birth_date" date NOT NULL,
  "first_name" varchar(14) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "sex" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "hire_date" date NOT NULL
)
;
ALTER TABLE "public"."employees" OWNER TO "postgres";

-- ----------------------------
-- Table structure for salaries
-- ----------------------------
DROP TABLE IF EXISTS "public"."salaries";
CREATE TABLE "public"."salaries" (
  "emp_no" int4 NOT NULL,
  "salary" int4 NOT NULL
)
;
ALTER TABLE "public"."salaries" OWNER TO "postgres";

-- ----------------------------
-- Table structure for titles
-- ----------------------------
DROP TABLE IF EXISTS "public"."titles";
CREATE TABLE "public"."titles" (
  "title_id" char(5) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."titles" OWNER TO "postgres";

-- ----------------------------
-- Primary Key structure for table departments
-- ----------------------------
ALTER TABLE "public"."departments" ADD CONSTRAINT "departments_pkey" PRIMARY KEY ("dept_no");

-- ----------------------------
-- Primary Key structure for table dept_emp
-- ----------------------------
ALTER TABLE "public"."dept_emp" ADD CONSTRAINT "dept_emp_pkey" PRIMARY KEY ("emp_no", "dept_no");

-- ----------------------------
-- Primary Key structure for table dept_manager
-- ----------------------------
ALTER TABLE "public"."dept_manager" ADD CONSTRAINT "dept_manager_pkey" PRIMARY KEY ("emp_no", "dept_no");

-- ----------------------------
-- Primary Key structure for table employees
-- ----------------------------
ALTER TABLE "public"."employees" ADD CONSTRAINT "employees_pkey" PRIMARY KEY ("emp_no");

-- ----------------------------
-- Primary Key structure for table salaries
-- ----------------------------
ALTER TABLE "public"."salaries" ADD CONSTRAINT "salaries_pkey" PRIMARY KEY ("emp_no");

-- ----------------------------
-- Primary Key structure for table titles
-- ----------------------------
ALTER TABLE "public"."titles" ADD CONSTRAINT "titles_pkey" PRIMARY KEY ("title_id");

-- ----------------------------
-- Foreign Keys structure for table dept_emp
-- ----------------------------
ALTER TABLE "public"."dept_emp" ADD CONSTRAINT "dept_emp_dept_no_fkey" FOREIGN KEY ("dept_no") REFERENCES "public"."departments" ("dept_no") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."dept_emp" ADD CONSTRAINT "dept_emp_emp_no_fkey" FOREIGN KEY ("emp_no") REFERENCES "public"."employees" ("emp_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dept_manager
-- ----------------------------
ALTER TABLE "public"."dept_manager" ADD CONSTRAINT "dept_manager_dept_no_fkey" FOREIGN KEY ("dept_no") REFERENCES "public"."departments" ("dept_no") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."dept_manager" ADD CONSTRAINT "dept_manager_emp_no_fkey" FOREIGN KEY ("emp_no") REFERENCES "public"."employees" ("emp_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table employees
-- ----------------------------
ALTER TABLE "public"."employees" ADD CONSTRAINT "employees_emp_title_id_fkey" FOREIGN KEY ("emp_title_id") REFERENCES "public"."titles" ("title_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table salaries
-- ----------------------------
ALTER TABLE "public"."salaries" ADD CONSTRAINT "salaries_emp_no_fkey" FOREIGN KEY ("emp_no") REFERENCES "public"."employees" ("emp_no") ON DELETE NO ACTION ON UPDATE NO ACTION;
